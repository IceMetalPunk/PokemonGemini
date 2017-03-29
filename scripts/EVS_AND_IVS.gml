/// EVS_AND_IVS(README! Do not use as a script!)

/* How EVs and IVs are calculated and used:

EVs are obtained for defeating a Pokemon in a battle that does give XP.
Each species gives its own combination of EVs when defeated, but each stat EV must be an
integer between 0 and 3, inclusive.

Only one byte used to store EVs, so max EV in any stat = 255.

Stats are: HP, Attack, Defense, Special Defense, Special Attack, and Speed

IVs are 6 bits (so 0-31), generated randomly when the Pokemon is generated.

At end of battle and on level up, after XP is gained, stats get increased
by += (base_stat / 50) + ((IV + EV) / 100)

Nature Bonus: after increase, multiply by 1.1 (so +10%)
Nature Detriment: after increase, multiply by 0.9 (so -10%)

*** Total stat calculation for a given level and EV/IV totals: ***

HP = level + 10 + floor(0.01 * level * (2 * base_HP + IV + floor(EV / 4))
OtherStats = natureMultiplier * (5 + floor(0.01 * level * (2 * base_HP + IV + floor(EV / 4)))

*/
