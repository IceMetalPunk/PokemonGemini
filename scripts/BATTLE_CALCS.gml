/// BATTLE_CALCS(README! Do not use as a script!)

/*

Evasion begins at 100% at the start of every battle.
Accuracy also begins at 100% at the start of every battle.

P = Accuracy_Of_Move * Accuracy_Of_Pokemon / Evasion_Of_Opponent;
Probability_Of_Hitting = median(0.33, P, 1)

In-battle, temporary stat modifiers work as such:

Range from [-6, 6] and begin at 0.
For regular stats:

Multiplier = { 2/(abs(stage) + 2) if stage <= 0
             { (stage + 2) / 2 if stage > 0
             
For accuracy and evasion:

Multiplier = { 3/(abs(stage) + 3) if stage <= 0
             { (stage + 3) / 3 if stage > 0
             
Damage:

Targets = 0.75 + (0.25 * (targets.length == 1));
Weather = 1 + 0.5 * (weather_boosts_type - weather_weakens_type);
Crit = 1 + 0.5 * isCrit;
Rand = random(0.85, 1.0)
STAB = 1 + ((0.5 + (pokemon.ability == Adaptability)) * (move.type == pokemon.type));
Type = !isImmuneToType * 1 / pow(2, weakTypes.length) * pow(2, strongTypes.length)
Burn = 1 - 0.5 * (isBurned && move.isPhysical && pokemon.ability != Guts)
Other = Usually 1, but can change in specific situations or with abilities; see bookmarked page for table

Modifier = Targets * Weather * Crit * Rand * STAB * Type * Burn * Other

cAttack = pokemon.Attack * isPhysical + pokemon.spAttack * isSpecial
cDefense = enemy.Defense * isPhysical + enemy.spDefense * isSpecial
if Power < 0, Damage = 0; else
    Damage = Modifier * (2 + (0.02 * Power * (cAttack / cDefense) * (2 + 0.2 * 2 * Level)))
    Damage = max(1, floor(Damage))

*/
