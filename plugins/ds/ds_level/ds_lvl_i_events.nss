// -----------------------------------------------------------------------------
//    File: ds_lvl_i_events.nss
//  System: DS Level System (events)
// -----------------------------------------------------------------------------
// Description:
//  Event functions for DS Subsystem.
// -----------------------------------------------------------------------------
// Builder Use:
//  None!  Leave me alone.
// -----------------------------------------------------------------------------

#include "util_i_data"
#include "util_i_time"
#include "util_i_chat"
#include "core_i_framework"
#include "ds_lvl_i_main"

// -----------------------------------------------------------------------------
//                              Function Prototypes
// -----------------------------------------------------------------------------

// ---< ds_lvl_OnPlayerChat >---
// Used for testing.  When the PC types the command .xpset in chat, it will set
// the XP of the player to that amount.
void ds_lvl_OnPlayerChat();

// -----------------------------------------------------------------------------
//                              Function Definitions
// -----------------------------------------------------------------------------
void ds_lvl_OnPlayerChat()
{
    object oTarget, oPC = GetPCChatSpeaker();
    if ((oTarget = GetChatTarget(oPC)) == OBJECT_INVALID)
        return;

    if (GetChatCommand(oPC) == "xpset")
    {
        int iXPVal = GetChatKeyValueInt(oPC, "xp");
        SetXP(oPC, iXPVal);
    } 
}