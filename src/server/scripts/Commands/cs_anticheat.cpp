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

#include "ScriptMgr.h"

#include "AnticheatMgr.h"
#include "Chat.h"
#include "Player.h"
#include "RBAC.h"
#include "World.h"
#include "WorldSession.h"

#include <string>

using namespace Trinity::ChatCommands;

namespace
{
bool HasAdministratorAccess(ChatHandler* handler)
{
    if (WorldSession* session = handler->GetSession(); session && session->GetSecurity() < SEC_ADMINISTRATOR)
    {
        handler->SendSysMessage("Administrator security is required for this anti-cheat command.");
        return false;
    }

    return true;
}
}

class anticheat_commandscript : public CommandScript
{
public:
    anticheat_commandscript() : CommandScript("anticheat_commandscript") { }

    ChatCommandTable GetCommands() const override
    {
        static ChatCommandTable anticheatCommandTable =
        {
            { "delete",    HandleAntiCheatDeleteCommand,     rbac::RBAC_PERM_COMMAND_GM, Console::Yes },
            { "deleteall", HandleAntiCheatDeleteAllCommand,  rbac::RBAC_PERM_COMMAND_GM, Console::Yes },
            { "global",    HandleAntiCheatGlobalCommand,     rbac::RBAC_PERM_COMMAND_GM, Console::Yes },
            { "handle",    HandleAntiCheatHandleCommand,     rbac::RBAC_PERM_COMMAND_GM, Console::Yes },
            { "jail",      HandleAntiCheatJailCommand,       rbac::RBAC_PERM_COMMAND_GM, Console::No },
            { "player",    HandleAntiCheatPlayerCommand,     rbac::RBAC_PERM_COMMAND_GM, Console::Yes },
            { "warn",      HandleAntiCheatWarnCommand,       rbac::RBAC_PERM_COMMAND_GM, Console::No },
        };
        static ChatCommandTable commandTable =
        {
            { "anticheat", anticheatCommandTable },
        };
        return commandTable;
    }

    static bool HandleAntiCheatDeleteCommand(ChatHandler* handler, PlayerIdentifier player)
    {
        if (!HasAdministratorAccess(handler))
            return false;

        sAnticheatMgr.AnticheatDeleteCommand(player.GetGUID().GetCounter());
        handler->SendSysMessage("Anti-cheat reports cleared for that player.");
        return true;
    }

    static bool HandleAntiCheatDeleteAllCommand(ChatHandler* handler)
    {
        if (!HasAdministratorAccess(handler))
            return false;

        sAnticheatMgr.AnticheatDeleteCommand(0);
        handler->SendSysMessage("All anti-cheat reports have been cleared.");
        return true;
    }

    static bool HandleAntiCheatGlobalCommand(ChatHandler* handler)
    {
        sAnticheatMgr.AnticheatGlobalCommand(handler);
        return true;
    }

    static bool HandleAntiCheatHandleCommand(ChatHandler* handler, std::string mode)
    {
        if (!HasAdministratorAccess(handler))
            return false;

        if (mode != "on" && mode != "off")
            return false;

        bool enabled = mode == "on";
        sWorld->setBoolConfig(CONFIG_ANTICHEAT_ENABLE, enabled);
        handler->PSendSysMessage("The anti-cheat system is now %s.", enabled ? "enabled" : "disabled");
        return true;
    }

    static bool HandleAntiCheatJailCommand(ChatHandler* handler, Optional<PlayerIdentifier> target)
    {
        if (!target)
            target = PlayerIdentifier::FromTarget(handler);
        if (!target || !target->IsConnected())
        {
            handler->SendSysMessage("The target player must be online.");
            return false;
        }

        Player* player = target->GetConnectedPlayer();
        if (handler->GetSession() && handler->GetSession()->GetPlayer() == player)
        {
            handler->SendSysMessage("You cannot jail yourself.");
            return false;
        }

        if (handler->GetSession() && player->GetSession()->GetSecurity() >= handler->GetSession()->GetSecurity())
        {
            handler->SendSysMessage("You cannot jail a player with equal or higher security.");
            return false;
        }

        WorldLocation jailLocation(1, 16226.5f, 16403.6f, -64.5f, 3.2f);
        if (!player->TeleportTo(jailLocation))
        {
            handler->SendSysMessage("The player could not be teleported to the jail.");
            return false;
        }

        player->SetHomebind(jailLocation, 876);
        player->GetSession()->SendNotification("You have been sent to jail by a game master.");
        handler->SendSysMessage("The player has been sent to jail.");
        return true;
    }

    static bool HandleAntiCheatPlayerCommand(ChatHandler* handler, Optional<PlayerIdentifier> player)
    {
        if (!player)
            player = PlayerIdentifier::FromTargetOrSelf(handler);
        if (!player)
            return false;

        AnticheatReportSummary summary;
        if (!sAnticheatMgr.GetPlayerSummary(player->GetGUID().GetCounter(), summary))
        {
            handler->SendSysMessage("No anti-cheat report data was found for that player.");
            return true;
        }

        handler->PSendSysMessage("GUID %u | reports %llu | average %.3f reports/second",
            summary.guid, static_cast<unsigned long long>(summary.totalReports), summary.average);
        handler->PSendSysMessage("Speed %llu | fly %llu | water-walk %llu | jump %llu",
            static_cast<unsigned long long>(summary.typeReports[ANTICHEAT_REPORT_SPEED]),
            static_cast<unsigned long long>(summary.typeReports[ANTICHEAT_REPORT_FLY]),
            static_cast<unsigned long long>(summary.typeReports[ANTICHEAT_REPORT_WATER_WALK]),
            static_cast<unsigned long long>(summary.typeReports[ANTICHEAT_REPORT_JUMP]));
        handler->PSendSysMessage("Teleport-plane %llu | climb %llu",
            static_cast<unsigned long long>(summary.typeReports[ANTICHEAT_REPORT_TELEPORT_PLANE]),
            static_cast<unsigned long long>(summary.typeReports[ANTICHEAT_REPORT_CLIMB]));
        return true;
    }

    static bool HandleAntiCheatWarnCommand(ChatHandler* handler, Optional<PlayerIdentifier> target)
    {
        if (!target)
            target = PlayerIdentifier::FromTarget(handler);
        if (!target || !target->IsConnected())
        {
            handler->SendSysMessage("The target player must be online.");
            return false;
        }

        target->GetConnectedPlayer()->GetSession()->SendNotification(
            "The anti-cheat system has reported suspicious movement. A game master will review your account.");
        handler->SendSysMessage("The player has been warned.");
        return true;
    }
};

void AddSC_anticheat_commandscript()
{
    new anticheat_commandscript();
}
