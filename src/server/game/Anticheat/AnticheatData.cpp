#include "AnticheatData.h"

#include "GameTime.h"
#include "Player.h"

AnticheatData::AnticheatData() : lastOpcode(0), hasLastMovementInfo(false)
{
    ResetReports();
}

void AnticheatData::ResetReports()
{
    summary = {};
    recentReports.fill(0);
    recentReportStartTime.fill(0);
}

void AnticheatData::InitializeMovement(Player* player)
{
    lastMovementInfo.pos.Relocate(player->GetPositionX(), player->GetPositionY(), player->GetPositionZ(), player->GetOrientation());
    lastMovementInfo.flags = 0;
    lastMovementInfo.flags2 = 0;
    lastMovementInfo.time = GameTime::GetGameTimeMS();
    lastOpcode = 0;
    hasLastMovementInfo = true;
}

void AnticheatData::SetLastMovementInfo(MovementInfo const& movementInfo, uint32 opcode)
{
    lastMovementInfo = movementInfo;
    lastOpcode = opcode;
    hasLastMovementInfo = true;
}
