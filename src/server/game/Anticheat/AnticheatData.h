#ifndef ANTICHEAT_DATA_H
#define ANTICHEAT_DATA_H

#include "MovementInfo.h"

#include <array>

enum AnticheatReportType : uint8
{
    ANTICHEAT_REPORT_SPEED = 0,
    ANTICHEAT_REPORT_FLY,
    ANTICHEAT_REPORT_WATER_WALK,
    ANTICHEAT_REPORT_JUMP,
    ANTICHEAT_REPORT_TELEPORT_PLANE,
    ANTICHEAT_REPORT_CLIMB,
    ANTICHEAT_REPORT_COUNT
};

enum AnticheatDetectionType : uint32
{
    ANTICHEAT_DETECT_SPEED = 1,
    ANTICHEAT_DETECT_FLY = 2,
    ANTICHEAT_DETECT_WATER_WALK = 4,
    ANTICHEAT_DETECT_JUMP = 8,
    ANTICHEAT_DETECT_TELEPORT_PLANE = 16,
    ANTICHEAT_DETECT_CLIMB = 32
};

struct AnticheatReportSummary
{
    uint32 guid = 0;
    uint64 creationTime = 0;
    float average = 0.0f;
    uint64 totalReports = 0;
    std::array<uint64, ANTICHEAT_REPORT_COUNT> typeReports{};
};

class Player;

struct AnticheatData
{
    AnticheatData();

    void ResetReports();
    void InitializeMovement(Player* player);
    void SetLastMovementInfo(MovementInfo const& movementInfo, uint32 opcode);

    MovementInfo lastMovementInfo;
    uint32 lastOpcode;
    bool hasLastMovementInfo;
    AnticheatReportSummary summary;
    std::array<uint32, ANTICHEAT_REPORT_COUNT> recentReports;
    std::array<uint32, ANTICHEAT_REPORT_COUNT> recentReportStartTime;
};

#endif
