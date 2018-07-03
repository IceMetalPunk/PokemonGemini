/// FAKEMON_IDEAS(README! Do not use as a script!)
/*

When capturing a Pokemon, first calculate the modified catch rate:

modRate = (3 * maxHP - 2 * currentHP) * catchRate * ballBonus * statusBonus / (3 * maxHP)

Where statusBonus = {
    2.5 if sleeping | frozen,
    1.5 if paralyzed | poisoned | burned,
    1 else
}

Then decide if it's a crit capture by calculating "c":

c = floor( modRate * dexBonus / 6)

Where dexBonus = {
    0 if 0-30 species caught,
    0.5 if 31-150,
    1 if 15-300,
    1.5 if 301-450,
    2 if 451-600,
    2.5 if > 600
}

critCapture = (irandom(255) < c)

If critCapture, number of shake checks = 1; else number of shake checks = 3.

Next, calculate shake probability:

shakeProb = 65536 / sqrt(sqrt(255 / modRate)) = 65536 / ((255 / modRate)^0.25)

Lastly, repeat numOfShakeChecks times:
    breakFree = (irandom(65535) >= shakeProb)
    if breakFree, the Pokemon breaks free
    
If the Pokemon hasn't broken free by the end of this, it is successfully captured.

If there's dark grass, then it provides a detriment by multiplying modRate by the following:

grassBonus = {
    0.3 if 0-30 species caught,
    0.5 if 30-150,
    0.7 if 151-300,
    0.8 if 301-450,
    0.9 if 451-600,
    1 if > 600
}

*/
