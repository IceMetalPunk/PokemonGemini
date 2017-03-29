/// adjust_levels(ds_list opponentTeam, ds_list playerTeam)
/* Syntax: adjust_levels(ds_list opponentTeam, ds_list playerTeam)

Arguments:
opponentTeam - A list of maps, each map identifying the characteristics of the opponent's Pokemon.
playerTeam - A list of maps, each map identifying the characteristics of the player's Pokemon.

Returns: Nothing.

Notes: This will increase the levels of the opponent's team to match the player's average level,
        but only if the player is of a higher average level than the opponent.
*/
var i, pAvg = 0, oAvg = 0, mon, diff = 0;
for (i = 0; i < ds_list_size(argument0); ++i) {
    mon = argument0[| i];
    oAvg += mon[? "level"];
}
oAvg /= ds_list_size(argument0);

for (i = 0; i < ds_list_size(argument1); ++i) {
    mon = argument1[| i];
    pAvg += mon[? "level"];
}
pAvg /= ds_list_size(argument1);

if (pAvg > oAvg) {
    diff = ceil(pAvg - oAvg);
    for (i = 0; i < ds_list_size(argument0); ++i) {
        mon = argument0[| i];
        mon[? "level"] += diff;
    }
}
