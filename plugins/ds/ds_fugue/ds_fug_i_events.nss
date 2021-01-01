// -----------------------------------------------------------------------------
//    File: ds_fug_i_events.nss
//  System: Fugue Death and Resurrection (events)
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
#include "ds_fug_i_main"

// -----------------------------------------------------------------------------
//                              Function Prototypes
// -----------------------------------------------------------------------------

// ---< ds_fug_OnPlayerDeath >---
// Upon death, drop all henchmen, generate a random number between 0 and 100
// If it is below the Angel value, the PC goes to the Fugue
// If it is greater the PC goes to the Angel's Home
// TODO - Druids or Rangers who die cannot respawn their familiar until they clear a condition.
void ds_fug_OnPlayerDeath();

// ---< ds_fug_OnClientEnter >---
// When the Player Character enters the module, store the date / time they showed up.
// This will be used later on to see how long it has been since they last died.
// TODO - This will be replaced by the OnPlayerRegistration capability that tinygiant is producing
void ds_fug_OnClientEnter();

// ---< ds_fug_OnPlayerChat >---
// Used for testing.  When the PC types the command .die in chat, it kills the PC
void ds_fug_OnPlayerChat();

// -----------------------------------------------------------------------------
//                              Function Definitions
// -----------------------------------------------------------------------------

void ds_fug_OnCharacterRegistration()
{
    object oPC = GetEnteringObject();
    string sTime = GetGameTime();

    SetDatabaseString("pc_enter_time", sTime, oPC);
}

void ds_fug_OnPlayerDeath()
{
    object oPC = GetLastPlayerDied();

    if (_GetLocalInt(oPC, H2_PLAYER_STATE) != H2_PLAYER_STATE_DEAD)
        return;  //PC ain't dead.  Return.

    // Generate a Random Number for Now
    // TODO -   Develop real rules based on many other things including recency of last death, alignment stray...
    int iRnd = d100();
    int iChance = clamp(DS_FUGUE_ANGEL_CHANCE, 0, 100);

    // Let the PW Fugue system take it from here.
    if (iRnd < (100 - iChance))
        return;

	if (GetTag(GetArea(oPC)) == ANGEL_PLANE)
    {
		//If you're already at the Angel, just make sure you're alive and healed.
		ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oPC)), oPC);
        return;
    }
    else
    {
		h2_DropAllHenchmen(oPC);
        SendPlayerToAngel(oPC);   
    }

    SetEventState(EVENT_STATE_ABORT);
}

void ds_fug_OnPlayerChat()
{
    object oTarget, oPC = GetPCChatSpeaker();
    if ((oTarget = GetChatTarget(oPC)) == OBJECT_INVALID)
        return;
    
    if (GetChatCommand(oPC) == "die")
    {
        int iHP = GetCurrentHitPoints(oPC) + 11;
        effect eDam = EffectDamage(iHP);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPC);
        SendChatResult("OK.  You're dead, then.", oPC);
    }
}