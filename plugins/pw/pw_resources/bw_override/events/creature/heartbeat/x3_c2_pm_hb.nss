
#include "util_i_data"
#include "core_i_constants"
#include "res_i_const"

void main()
{
    _SetLocalInt(OBJECT_SELF, FRAMEWORK_OUTSIDER, TRUE);
    _SetLocalString(OBJECT_SELF, CREATURE_EVENT_ON_HEARTBEAT, "x3_c2_pm_hb:last");
    ExecuteScript("hook_creature07", OBJECT_SELF);
}
