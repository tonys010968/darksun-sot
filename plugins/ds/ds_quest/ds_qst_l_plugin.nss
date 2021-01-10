// -----------------------------------------------------------------------------
//    File: ds_qst_l_plugin.nss
//  System: Quest Handler (library)
// -----------------------------------------------------------------------------
// Description:
//  Library functions for DS Subsystem
// -----------------------------------------------------------------------------
// Builder Use:
//  None!  Leave me alone.
// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
#include "util_i_library"
#include "util_i_chat"
#include "core_i_framework"
#include "pw_i_const"
#include "ds_qst_i_events"

// -----------------------------------------------------------------------------
// Library Dispatch
// -----------------------------------------------------------------------------
void OnLibraryLoad() 
{
    if (!USE_QUEST_SYSTEM)
        return;

    object oPlugin = GetPlugin("ds");

    // ----- Module Events -----
    RegisterEventScripts(oPlugin, CHAT_PREFIX + ".", "quest_OnPlayerChat");

    // ----- Module Scripts -----
    RegisterLibraryScript("quest_OnPlayerChat", 1);
}

void OnLibraryScript(string sScript, int nEntry)
{
    switch (nEntry)
    {
        case 1: quest_OnPlayerChat(); break;

        default: CriticalError("Library function " + sScript + " not found");
    }
}