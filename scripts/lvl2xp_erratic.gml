/// lvl2xp_erratic(int level)
/*

Returns the total amount of XP needed for a erratic-group 'mon to reach the given level.

*/
var n = argument0;
if (n<=50) {
    return (power(n,3) * (100 - n)) / 50;
}
else if (n<=68) {
    return (power(n,3) * (150 - n)) / 100;
}
else if (n<=98) {
    return (power(n,3) * floor((1911 - 10 * n) / 3)) / 500;
}
else {
    return (power(n,3) * (160 - n)) / 100;
}
