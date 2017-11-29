/// evolve_proper(ds_map mon)
/* Checks the 'mon's levels and species and swaps it with its evolution if appropriate.
This is only called from adjust_levels to ensure difficulty, it's not required for every
'mon or trainer. */

if (!ds_map_exists(argument0, "species")) {
    show_error("Pokrmon does not have a species ID!", true);
    return undefined;
}
var spec = argument0[? "species"];

if (!ds_map_exists(global.POKEMON, spec)) {
    show_error("Pokemon has species ID "+string(spec)+", which does not exist.", true);
    return undefined;
}
spec = global.POKEMON[? spec];
var evos = spec[? "evolutions"];
var evo;
for (var p=0; p<ds_list_size(evos); ++p) {
    evo = evos[| p];
    if (evo[? "method"] == "level" && has_requirements(evo[? "requirements"], argument0)) {
        argument0[? "species"] = evo[? "into"];
        return evolve_proper(argument0);
    }
}
return true;
