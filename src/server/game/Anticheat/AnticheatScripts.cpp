#include "AnticheatScripts.h"

#include "AnticheatMgr.h"

AnticheatScripts::AnticheatScripts() : PlayerScript("AnticheatScripts")
{
}

void AnticheatScripts::OnLogin(Player* player, bool /*firstLogin*/)
{
    sAnticheatMgr.HandlePlayerLogin(player);
}

void AnticheatScripts::OnLogout(Player* player)
{
    sAnticheatMgr.HandlePlayerLogout(player);
}

void AddSC_anticheat_scripts()
{
    new AnticheatScripts();
}
