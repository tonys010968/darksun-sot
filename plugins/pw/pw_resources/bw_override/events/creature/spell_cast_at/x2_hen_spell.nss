
#include "util_i_data"
#include "core_i_constants"
#include "res_i_const"

void main()
{
    _SetLocalInt(OBJECT_SELF, FRAMEWORK_OUTSIDER, TRUE);
    _SetLocalString(OBJECT_SELF, CREATURE_EVENT_ON_SPELL_CAST_AT, "x2_hen_spell:last");
    ExecuteScript("hook_creature12", OBJECT_SELF);
}
