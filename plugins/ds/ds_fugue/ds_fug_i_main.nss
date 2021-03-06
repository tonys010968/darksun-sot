// -----------------------------------------------------------------------------
//    File: ds_fug_i_main.nss
//  System: Fugue Death and Resurrection (core)
// -----------------------------------------------------------------------------
// Description:
//  Core functions for DS Subsystem.
// -----------------------------------------------------------------------------
// Builder Use:
//  None!  Leave me alone.
// -----------------------------------------------------------------------------
#include "ds_i_const"
#include "fugue_i_main"
#include "ds_fug_i_const"
#include "ds_fug_i_config"
#include "ds_fug_i_text"
#include "pw_i_core"

// -----------------------------------------------------------------------------
//                              Function Prototypes
// -----------------------------------------------------------------------------

// ---< SendPlayerToAngel >---
// Sends dead player character to the angel plane.
void SendPlayerToAngel(object oPC);

// -----------------------------------------------------------------------------
//                              Function Definitions
// -----------------------------------------------------------------------------
void SendPlayerToAngel(object oPC)
{
    object oAngelWP = GetObjectByTag(WP_ANGEL);
    SendMessageToPC(oPC, H2_TEXT_YOU_HAVE_DIED);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oPC)), oPC);

    h2_RemoveEffects(oPC);
    ClearAllActions();
    AssignCommand(oPC, JumpToObject(oAngelWP));
}
