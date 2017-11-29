/// MAP_FORMATS(README! Do not use as a script!)
/*

Many things in this game will be represented as maps and lists, so that there doesn't need
to be a full object, with all its overhead, for each of them. This document describes some
of the map formats used. Any property with a ? after it is subject to removal or change.

MOVE = Map {
    "id": int_move_id,
    "pp": int,
    "disabled": boolean
}

EVOLUTION = Map {
    "into": int_species_id,
    "method": string (level || friendship || itemUse || trade || location),
    "value": int or string value for method | ignored for 'trade' method,
    "requirements": [list_of_evolution_requirements]
}

EVOLUTION_REQUIREMENTS = Map {
    "type": string (knowsMove || holdingItem || gender),
    "value": int (moveID, itemID, or 0=genderless/1=male/2=female)
}

SPECIES = Map {
    "timestamp": int_creation_timestamp,
    "name": string,
    "types": [list_of_string_types],
    "learnset": [list_of_int_move_ids->followed_by->int_level_learned],
    "evolutions": [list_of_evolution_maps],
    "evolvesFrom": int_species_id,
    "genderThreshold": int,
    "baseStats": { map_of_statName=>int_base_value },
    "EVs": { map_of_statName=>int_ev_value_from_0_to_3 },
    "exp_group": string_lvl2xp_group_name
}

POKEMON =  Map {
    "level": int,
    "name": string,
    "species": int_species_id,
    "hp": int,
    "maxHP": int,
    "attack": int,
    "defense": int,
    "spAttack": int,
    "spDefense": int,
    "speed": int,
    "accuracy": int,
    "evasion": int,
    "statusEffects": [list_of_int_status_ids],
    "holdingItem": int_item_id,
    "nature": string?,
    "personality": int_personality_value,
    "gender": int (0=genderless, 1=male, 2=female)
    "moves": [list_of_move_ids],
    "xp": int,
    "flags": { map_of_flagName=>flagValue }
}

TEAM = List [list_of_Pokemon]

Flags are used to track data for custom move effects; for example, Defense Curl would set
a flag that can be checked by Rollout to modify its power, and Rollout can increase a flag
to track how many hits it's landed to double the power each hit.

~~ GLOBAL MAPS ~~

A couple of global maps exist for lookup:

GLOBAL.POKEMON = Map {
    #id: SPECIES_MAP
}

GLOBAL.MOVES = Map {
    #id: { full_move_map }
}

The format of FULL_MOVE is complex and so is listed separately, in the JSON_Formats.json
file. The GLOBAL.POKEMON map will assign IDs based on timestamps of the SPECIES inside it;
evolution dependencies don't determine species ID order, so if you want their IDs to be
adjacent, you must create them in the proper order.

*/
