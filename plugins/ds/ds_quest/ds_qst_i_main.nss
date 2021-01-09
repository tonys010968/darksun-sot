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
//                       Envisioning for the Quest System
// -----------------------------------------------------------------------------
// There will be a database table created to support the Quest System.
// This table will track the player's activities on the It will
// have the following structure:
// PlayerID             <int?>          PK
// Quest ID             <int?>          PK
// Attempt              <int>           PK  - For some quests the player can
//                                      repeat them so this will allow the key
//                                      to remain intact.
// Quest Step           <int>           This is the step that the player is
//                                      currently on in the quest.  This will
//                                      allow us to rebuild the journal for the
//                                      player each time they log on.
// Complete             <boolean>       True will indicate that the player
//                                      has completed the quest.  False indicates
//                                      it's still in progress.
//
// The second table will actually contain the Quest Information itself.  It will
// be structured as follows:
// Quest ID             <int>           PK
// Plot ID              <string>        PK.  This would allow the quests to tie
//                                      together into a larger "plot" structure.
// Times Allowed        <int>           This would indicate how many times the player could
//                                      be granted and complete this test.  If it's 0, it would
//                                      be unlimited.
// RequiredGold         <int>           NULL OK.  This would be used if a player
//                                      needed to buy into the quest with a certain
//                                      amount of gold.
// RequiredRace         <string>        NULL OK.  This would be the race of the character that
//                                      is permitted to pursue the quest.  Comma separated for
//                                      multiple values.
// RequiredClass        <string>        NULL OK.  This is the class of the character that
//                                      can pursue this quest.  Comma separated for multiple values.
// MinLevel             <int>           NULL OK.  The minimum level the player must be at to receive this
//                                      quest.
// MaxLevel             <int>           NULL OK.  The player cannot be above this level and get this quest.
// RequiredItem         <string>        NULL OK.  The resref of the item the player must possess this 
//                                      item to be given this quest.  Comma separated for multiple.
// GPPrize              <int>           NULL OK.  This is the prize that the player will be
//                                      granted when the quest is completed.
// ItemPrize            <string>        NULL OK.  This is the resref of the prize that the
//                                      player gets if they complete the quest.
// XPPrize              <int>           NULL OK.  This is the amount of the XP the
//                                      player will be given if they complete the quest.
// AmountCL             <int>           NULL OK.  The shift toward chaotic or lawful that the
//                                      player will have happen if the player completes the quest.
// AmountGE             <int>           NULL OK.  The shift toward good or evil that the player
//                                      will have happen if the player completes the quest.
// -----------------------------------------------------------------------------
// Chat Commands
//      .exportquests       --all / --qnum=...  --fname=...
//          This chat command will write the quests out to a .2da file.  It should be
//          limited to developers and builders.  --all will write all quests.  --qnum=...
//          will write only the selected quest. --fname allows the exporter to choose
//          a specific filename to export to.  Otherwise, the filename defined in the
//          constants file will be used.
//     
//      .addquest           --fname=...
//          This chat command will read the 2da named fname and will load the quest into
//          the database table.
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