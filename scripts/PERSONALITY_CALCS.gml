/// PERSONALITY_CALCS(README! Do not use as a script!)

// Calculations:
// TrainerID = irandom(10000, 65535); Assigned to player on game start
// SecretID = irandom(10000, 65535); Assigned to player on game start

// PersonalityValue = irandom(0, 4294967295); assigned to 'mon when encountered/obtained
// If PersonalityValue & 255 >= genderThreshold(species), gender = male
// // Unless thesh = 0 (all male), 254 (all female), or 255 (genderless)
// Ability Choice = (PersonalityValue >> 16) % 2; unless only 1 ability is possible
// Nature = nature_table[PersonalityValue % 25]; see bookmarked Bulbapedia page for table

// boolean Shininess = ((TrainerID ^ SecretID) ^ (((PersonalityValue >> 8) & 255) ^ (PersonalityValue & 255))) < 16;
