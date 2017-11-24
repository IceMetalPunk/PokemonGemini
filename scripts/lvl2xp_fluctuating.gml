/// lvl2xp_fluctuating(int level)
/*

Returns the total amount of XP needed for a fluctuating-group 'mon to reach the given level.

*/
var n = argument0;
if (n<=15) {
    return power(n,3) * ((24 + floor((n + 1) / 3)) / 50);
}
else if (n<=36) {
    return power(n,3) * (n + 14) / 50;
}
else {
    return power(n,3) * ((32 + floor(n / 2)) / 50);
}
