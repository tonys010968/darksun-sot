
#include "util_i_data"
#include "core_i_constants"
#include "res_i_const"

void main()
{
    _SetLocalInt(OBJECT_SELF, FRAMEWORK_OUTSIDER, TRUE);
    _SetLocalString(OBJECT_SELF, CREATURE_EVENT_ON_COMBAT_ROUND_END, "x2_def_endcombat:last");
    ExecuteScript("hook_creature02", OBJECT_SELF);
}
