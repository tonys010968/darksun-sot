// -----------------------------------------------------------------------------
//    File: ds_qst_i_main.nss
//  System: Quest System (core)
// -----------------------------------------------------------------------------
// Description:
//  Core functions for DS Subsystem.
// -----------------------------------------------------------------------------
// Builder Use:
//  None!  Leave me alone.
// -----------------------------------------------------------------------------
#include "ds_i_const"
#include "fugue_i_main"
#include "ds_qst_i_const"
#include "ds_qst_i_config"
#include "ds_qst_i_text"
#include "pw_i_core"

// -----------------------------------------------------------------------------
//                              Function Prototypes
// -----------------------------------------------------------------------------
//                        --<RebuildJournalQuestEntries>--
// This function is probably to be called in the OnClientEnter event.  It will
// rebuild the PCs quest entries in their journal based on the state they were
// left in.  
void RebuildJournalQuestEntries(object oCreature);

// -----------------------------------------------------------------------------
//                              Function Body
// -----------------------------------------------------------------------------