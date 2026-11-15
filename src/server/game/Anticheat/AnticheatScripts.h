#ifndef ANTICHEAT_SCRIPTS_H
#define ANTICHEAT_SCRIPTS_H

#include "ScriptMgr.h"

class AnticheatScripts : public PlayerScript
{
public:
    AnticheatScripts();

    void OnLogin(Player* player, bool firstLogin) override;
    void OnLogout(Player* player) override;
};

#endif
