/// has_requirements(ds_list reqs, ds_map pokemon)
/* Returns true if the given Pokemon satisfies all the evolution requirements on the
given list */

var req, type, val;
for (var p=0; p<ds_list_size(argument0); ++p) {
    req = argument0[| p];
    type = req[? "type"];
    value = req[? "value"];
    switch (type) {
        case "holdingItem":
            if (argument1[? "holdingItem"] != value) { return false; }
            break;
        case "gender":
            if (argument1[? "gender"] != value) { return false; }
            break;
        case "knowsMove":
            var moves = argument1[? "moves"], found=false;
            for (var j=0; j<ds_list_size(moves); ++j) {
                if (moves[| j] == value) {
                    found=true;
                    break;
                }
            }
            if (!found) { return false; }
            break;
        default:
            show_error("Requirements list has unknown requirement "+type+".", true);
            return false;
    }
}
