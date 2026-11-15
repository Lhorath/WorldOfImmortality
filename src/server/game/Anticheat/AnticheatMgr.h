#ifndef ANTICHEAT_MGR_H
#define ANTICHEAT_MGR_H

#include "AnticheatData.h"

#include <unordered_map>

class ChatHandler;
class Player;

class AnticheatMgr
{
public:
    static AnticheatMgr& Instance();

    void StartHackDetection(Player* player, MovementInfo const& movementInfo, uint32 opcode, uint32 reportedFlags);
    void HandlePlayerLogin(Player* player);
    void HandlePlayerLogout(Player* player);

    bool GetPlayerSummary(uint32 guid, AnticheatReportSummary& summary);
    void AnticheatGlobalCommand(ChatHandler* handler);
    void AnticheatDeleteCommand(uint32 guid);

private:
    void LoadPlayerData(uint32 guid, AnticheatData& data);
    void SavePlayerData(AnticheatData const& data);
    void BuildReport(Player* player, AnticheatData& data, AnticheatReportType reportType);

    void SpeedHackDetection(Player* player, AnticheatData& data, MovementInfo const& movementInfo);
    void FlyHackDetection(Player* player, AnticheatData& data, MovementInfo const& movementInfo, uint32 reportedFlags);
    void WalkOnWaterHackDetection(Player* player, AnticheatData& data, uint32 reportedFlags);
    void JumpHackDetection(Player* player, AnticheatData& data, uint32 opcode);
    void TeleportPlaneHackDetection(Player* player, AnticheatData& data, MovementInfo const& movementInfo);
    void ClimbHackDetection(Player* player, AnticheatData& data, MovementInfo const& movementInfo, uint32 opcode);

    std::unordered_map<uint32, AnticheatData> _players;
};

#define sAnticheatMgr AnticheatMgr::Instance()

#endif
