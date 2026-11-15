/*
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "AnticheatMgr.h"

#include "Chat.h"
#include "DatabaseEnv.h"
#include "GameTime.h"
#include "Map.h"
#include "Opcodes.h"
#include "Player.h"
#include "SpellAuras.h"
#include "Timer.h"
#include "World.h"
#include "WorldSession.h"

#include <cmath>

namespace
{
constexpr float MAX_SPEED_MULTIPLIER = 1.5f;
constexpr float MAX_SPEED_ALLOWANCE = 2.0f;
constexpr uint32 REPORT_CONFIRMATION_WINDOW_MS = 3000;
constexpr uint32 REPORT_CONFIRMATION_COUNT = 3;
}

AnticheatMgr& AnticheatMgr::Instance()
{
    static AnticheatMgr instance;
    return instance;
}

void AnticheatMgr::StartHackDetection(Player* player, MovementInfo const& movementInfo, uint32 opcode, uint32 reportedFlags)
{
    if (!player)
        return;

    uint32 guid = player->GetGUID().GetCounter();
    auto [itr, inserted] = _players.try_emplace(guid);
    AnticheatData& data = itr->second;
    if (inserted)
    {
        LoadPlayerData(guid, data);
        data.InitializeMovement(player);
    }

    if (!data.hasLastMovementInfo)
        data.InitializeMovement(player);

    if (!sWorld->getBoolConfig(CONFIG_ANTICHEAT_ENABLE) || player->IsGameMaster() ||
        player->IsInFlight() || player->GetTransport() || player->GetVehicle())
    {
        data.SetLastMovementInfo(movementInfo, opcode);
        return;
    }

    uint32 detectionsEnabled = sWorld->getIntConfig(CONFIG_ANTICHEAT_DETECTIONS_ENABLED);
    if (detectionsEnabled & ANTICHEAT_DETECT_SPEED)
        SpeedHackDetection(player, data, movementInfo);
    if (detectionsEnabled & ANTICHEAT_DETECT_FLY)
        FlyHackDetection(player, data, movementInfo, reportedFlags);
    if (detectionsEnabled & ANTICHEAT_DETECT_WATER_WALK)
        WalkOnWaterHackDetection(player, data, reportedFlags);
    if (detectionsEnabled & ANTICHEAT_DETECT_JUMP)
        JumpHackDetection(player, data, opcode);
    if (detectionsEnabled & ANTICHEAT_DETECT_TELEPORT_PLANE)
        TeleportPlaneHackDetection(player, data, movementInfo);
    if (detectionsEnabled & ANTICHEAT_DETECT_CLIMB)
        ClimbHackDetection(player, data, movementInfo, opcode);

    data.SetLastMovementInfo(movementInfo, opcode);
}

void AnticheatMgr::HandlePlayerLogin(Player* player)
{
    uint32 guid = player->GetGUID().GetCounter();
    AnticheatData& data = _players[guid];
    data.ResetReports();
    data.summary.guid = guid;
    LoadPlayerData(guid, data);
    data.InitializeMovement(player);
}

void AnticheatMgr::HandlePlayerLogout(Player* player)
{
    uint32 guid = player->GetGUID().GetCounter();
    auto itr = _players.find(guid);
    if (itr == _players.end())
        return;

    if (itr->second.summary.totalReports)
        SavePlayerData(itr->second);
    _players.erase(itr);
}

void AnticheatMgr::LoadPlayerData(uint32 guid, AnticheatData& data)
{
    data.summary.guid = guid;
    QueryResult result = CharacterDatabase.PQuery(
        "SELECT creation_time, average, total_reports, speed_reports, fly_reports, jump_reports, waterwalk_reports, "
        "teleportplane_reports, climb_reports FROM players_reports_status WHERE guid = {}",
        guid);
    if (!result)
        return;

    Field* fields = result->Fetch();
    data.summary.creationTime = fields[0].GetUInt64();
    data.summary.average = fields[1].GetFloat();
    data.summary.totalReports = fields[2].GetUInt64();
    data.summary.typeReports = {
        fields[3].GetUInt64(),
        fields[4].GetUInt64(),
        fields[5].GetUInt64(),
        fields[6].GetUInt64(),
        fields[7].GetUInt64(),
        fields[8].GetUInt64()
    };
}

void AnticheatMgr::SavePlayerData(AnticheatData const& data)
{
    AnticheatReportSummary const& summary = data.summary;
    CharacterDatabase.PExecute(
        "REPLACE INTO players_reports_status "
        "(guid, creation_time, average, total_reports, speed_reports, fly_reports, jump_reports, waterwalk_reports, "
        "teleportplane_reports, climb_reports) VALUES ({}, {}, {}, {}, {}, {}, {}, {}, {}, {})",
        summary.guid, summary.creationTime, summary.average, summary.totalReports, summary.typeReports[ANTICHEAT_REPORT_SPEED],
        summary.typeReports[ANTICHEAT_REPORT_FLY], summary.typeReports[ANTICHEAT_REPORT_JUMP],
        summary.typeReports[ANTICHEAT_REPORT_WATER_WALK], summary.typeReports[ANTICHEAT_REPORT_TELEPORT_PLANE],
        summary.typeReports[ANTICHEAT_REPORT_CLIMB]);
}

bool AnticheatMgr::GetPlayerSummary(uint32 guid, AnticheatReportSummary& summary)
{
    if (auto itr = _players.find(guid); itr != _players.end())
    {
        summary = itr->second.summary;
        return true;
    }

    QueryResult result = CharacterDatabase.PQuery(
        "SELECT creation_time, average, total_reports, speed_reports, fly_reports, jump_reports, waterwalk_reports, "
        "teleportplane_reports, climb_reports FROM players_reports_status WHERE guid = {}",
        guid);
    if (!result)
        return false;

    Field* fields = result->Fetch();
    summary.guid = guid;
    summary.creationTime = fields[0].GetUInt64();
    summary.average = fields[1].GetFloat();
    summary.totalReports = fields[2].GetUInt64();
    summary.typeReports = {
        fields[3].GetUInt64(),
        fields[4].GetUInt64(),
        fields[5].GetUInt64(),
        fields[6].GetUInt64(),
        fields[7].GetUInt64(),
        fields[8].GetUInt64()
    };
    return true;
}

void AnticheatMgr::AnticheatGlobalCommand(ChatHandler* handler)
{
    QueryResult result = CharacterDatabase.Query(
        "SELECT guid, average, total_reports FROM players_reports_status WHERE total_reports != 0 "
        "ORDER BY total_reports DESC LIMIT 10");
    if (!result)
    {
        handler->SendSysMessage("No anti-cheat reports found.");
        return;
    }

    handler->SendSysMessage("Players with the most anti-cheat reports:");
    do
    {
        Field* fields = result->Fetch();
        handler->PSendSysMessage("GUID %u | reports %llu | average %.3f reports/second",
            fields[0].GetUInt32(), static_cast<unsigned long long>(fields[2].GetUInt64()), fields[1].GetFloat());
    } while (result->NextRow());
}

void AnticheatMgr::AnticheatDeleteCommand(uint32 guid)
{
    if (!guid)
    {
        for (auto& [playerGuid, data] : _players)
        {
            data.ResetReports();
            data.summary.guid = playerGuid;
        }
        CharacterDatabase.Execute("DELETE FROM players_reports_status");
        return;
    }

    if (auto itr = _players.find(guid); itr != _players.end())
    {
        itr->second.ResetReports();
        itr->second.summary.guid = guid;
    }
    CharacterDatabase.PExecute("DELETE FROM players_reports_status WHERE guid = {}", guid);
}

void AnticheatMgr::SpeedHackDetection(Player* player, AnticheatData& data, MovementInfo const& movementInfo)
{
    MovementInfo const& previous = data.lastMovementInfo;
    if (movementInfo.HasMovementFlag(MOVEMENTFLAG_ONTRANSPORT) || previous.HasMovementFlag(MOVEMENTFLAG_ONTRANSPORT) ||
        movementInfo.HasMovementFlag(MOVEMENTFLAG_FALLING) || player->IsFalling())
        return;

    uint32 timeDiff = getMSTimeDiff(previous.time, movementInfo.time);
    if (timeDiff < 100 || timeDiff > 10000)
        return;

    UnitMoveType moveType = MOVE_RUN;
    if (movementInfo.HasMovementFlag(MOVEMENTFLAG_SWIMMING))
        moveType = MOVE_SWIM;
    else if (player->IsFlying())
        moveType = MOVE_FLIGHT;
    else if (movementInfo.HasMovementFlag(MOVEMENTFLAG_WALKING))
        moveType = MOVE_WALK;

    float elapsedSeconds = static_cast<float>(timeDiff) / static_cast<float>(IN_MILLISECONDS);
    float distance = movementInfo.pos.GetExactDist2d(&previous.pos);
    float speed = player->GetSpeed(moveType);
    if (distance / elapsedSeconds > speed * MAX_SPEED_MULTIPLIER + MAX_SPEED_ALLOWANCE)
        BuildReport(player, data, ANTICHEAT_REPORT_SPEED);
}

void AnticheatMgr::FlyHackDetection(Player* player, AnticheatData& data, MovementInfo const& movementInfo, uint32 reportedFlags)
{
    if (!(reportedFlags & (MOVEMENTFLAG_FLYING | MOVEMENTFLAG_CAN_FLY | MOVEMENTFLAG_DISABLE_GRAVITY)))
        return;

    if (player->CanFly() || movementInfo.HasMovementFlag(MOVEMENTFLAG_CAN_FLY) ||
        player->HasAuraType(SPELL_AURA_FLY) ||
        player->HasAuraType(SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED) ||
        player->HasAuraType(SPELL_AURA_MOD_INCREASE_FLIGHT_SPEED))
        return;

    BuildReport(player, data, ANTICHEAT_REPORT_FLY);
}

void AnticheatMgr::WalkOnWaterHackDetection(Player* player, AnticheatData& data, uint32 reportedFlags)
{
    if (!(reportedFlags & MOVEMENTFLAG_WATERWALKING) || !player->IsAlive())
        return;

    if (player->HasAuraType(SPELL_AURA_GHOST) || player->HasAuraType(SPELL_AURA_WATER_WALK))
        return;

    BuildReport(player, data, ANTICHEAT_REPORT_WATER_WALK);
}

void AnticheatMgr::JumpHackDetection(Player* player, AnticheatData& data, uint32 opcode)
{
    if (data.lastOpcode == MSG_MOVE_JUMP && opcode == MSG_MOVE_JUMP)
        BuildReport(player, data, ANTICHEAT_REPORT_JUMP);
}

void AnticheatMgr::TeleportPlaneHackDetection(Player* player, AnticheatData& data, MovementInfo const& movementInfo)
{
    MovementInfo const& previous = data.lastMovementInfo;
    if (previous.pos.GetPositionZ() != 0.0f || movementInfo.pos.GetPositionZ() != 0.0f ||
        movementInfo.HasMovementFlag(MOVEMENTFLAG_FALLING) || !player->IsAlive())
        return;

    float groundZ = player->GetMap()->GetHeight(movementInfo.pos.GetPositionX(), movementInfo.pos.GetPositionY(),
        movementInfo.pos.GetPositionZ());
    if (groundZ <= INVALID_HEIGHT || std::fabs(groundZ - movementInfo.pos.GetPositionZ()) <= 1.0f)
        return;

    BuildReport(player, data, ANTICHEAT_REPORT_TELEPORT_PLANE);
}

void AnticheatMgr::ClimbHackDetection(Player* player, AnticheatData& data, MovementInfo const& movementInfo, uint32 opcode)
{
    MovementInfo const& previous = data.lastMovementInfo;
    if (opcode == MSG_MOVE_JUMP || player->IsInWater() || player->IsFlying() || player->IsFalling() ||
        movementInfo.HasMovementFlag(MOVEMENTFLAG_FALLING) || movementInfo.HasMovementFlag(MOVEMENTFLAG_SWIMMING))
        return;

    float horizontalDistance = movementInfo.pos.GetExactDist2d(&previous.pos);
    if (horizontalDistance < 0.1f)
        return;

    float verticalDistance = std::fabs(movementInfo.pos.GetPositionZ() - previous.pos.GetPositionZ());
    if (std::atan2(verticalDistance, horizontalDistance) > 1.0f)
        BuildReport(player, data, ANTICHEAT_REPORT_CLIMB);
}

void AnticheatMgr::BuildReport(Player* player, AnticheatData& data, AnticheatReportType reportType)
{
    uint32 now = GameTime::GetGameTimeMS();
    uint32& startTime = data.recentReportStartTime[reportType];
    uint32& recentReports = data.recentReports[reportType];
    if (!startTime || getMSTimeDiff(startTime, now) > REPORT_CONFIRMATION_WINDOW_MS)
    {
        startTime = now;
        recentReports = 1;
        return;
    }

    if (++recentReports < REPORT_CONFIRMATION_COUNT)
        return;

    startTime = now;
    recentReports = 0;

    AnticheatReportSummary& summary = data.summary;
    uint64 nowSeconds = static_cast<uint64>(GameTime::GetGameTime());
    if (!summary.totalReports || !summary.creationTime)
        summary.creationTime = nowSeconds;

    ++summary.totalReports;
    ++summary.typeReports[reportType];
    uint64 elapsedSeconds = nowSeconds > summary.creationTime ? nowSeconds - summary.creationTime : 1;
    summary.average = float(summary.totalReports) / float(elapsedSeconds);
    SavePlayerData(data);

    TC_LOG_WARN("anticheat", "Potential movement cheat (report type {}) for player {} (GUID {})",
        uint32(reportType), player->GetName(), summary.guid);

    uint32 notifyThreshold = sWorld->getIntConfig(CONFIG_ANTICHEAT_REPORTS_INGAME_NOTIFICATION);
    if (notifyThreshold && summary.totalReports == notifyThreshold)
        for (SessionMap::value_type const& sessionPair : sWorld->GetAllSessions())
            if (WorldSession* session = sessionPair.second; session && session->GetSecurity() >= SEC_GAMEMASTER)
                session->SendNotification("[Anticheat] A player has reached the configured report threshold.");
}
