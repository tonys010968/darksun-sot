// -----------------------------------------------------------------------------
//    File: ds_qst_i_events.nss
//  System: Quest System (events)
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
#include "ds_qst_i_main"

//TODO - Rebuild the Journal Entries in the OnClientEnter event.
//TODO - Create an event that triggers when the player completes the quest.  OnQuestCompleted?
//TODO - Create an event that triggers when a player received a quest.
void quest_OnPlayerChat()
{
    Notice("In Quest OnPlayerChat");
    object oTarget, oPC = GetPCChatSpeaker();
    if ((oTarget = GetChatTarget(oPC)) == OBJECT_INVALID)
        return;
    
    string sCommand = GetChatCommand(oPC);
    if (sCommand == "addquest")
    {
        string QstTag = GetChatKeyValue(oPC, "tag");
        if (QstTag == "")
        {
            SendChatResult("No Quest Tag Supplied.", oPC);
        }
        else
        {
            GiveQuest(oPC, QstTag);
            SendChatResult("Quest " + QstTag + " assigned to " + GetName(oTarget) + ".", oPC);
        }
    }
}