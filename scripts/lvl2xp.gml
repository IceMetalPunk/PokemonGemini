/// lvl2xp(string type, int level)

var type=argument0, lvl=argument1;

if (type == "") { return undefined; }

var scname = "lvl2xp_" + type;
var scriptID = asset_get_index(scname);
if (script_exists(scriptID)) {
    return script_execute(scriptID, lvl);
}
else {
    return undefined;
}
