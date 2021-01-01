// -----------------------------------------------------------------------------
//    File: ds_lvl_l_plugin.nss
//  System: DS Level System (library)
// -----------------------------------------------------------------------------
// Description:
//  Library functions for DS Subsystem
// -----------------------------------------------------------------------------
// Builder Use:
//  None!  Leave me alone.
// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
// Jacyn -Added the Registration for the ds_lvl_OnPlayerChat Handler
// -----------------------------------------------------------------------------

#include "util_i_library"
#include "util_i_chat"
#include "core_i_framework"
#include "pw_i_const"
#include "ds_lvl_i_events"

// -----------------------------------------------------------------------------
// Library Dispatch
// -----------------------------------------------------------------------------
void OnLibraryLoad() 
{
    if (!USE_LEVEL_SYSTEM)
        return;

    object oPlugin = GetPlugin("ds");

    // No priority needed here.
    RegisterEventScripts(oPlugin, CHAT_PREFIX + ".xpset", "ds_lvl_OnPlayerChat");

    // ----- Module Scripts -----
    RegisterLibraryScript("ds_lvl_OnPlayerChat", 1);
}

void OnLibraryScript(string sScript, int nEntry)
{
    switch (nEntry)
    {
        case 1: ds_lvl_OnPlayerChat(); break;

        default: CriticalError("Library function " + sScript + " not found");
    }
}
