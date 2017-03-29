/// CREDITS_AND_NOTES(README! Do not use as a script!)
// THIS IS NOT A SCRIPT! README!
/*

    TODO:
    The dual versions will be Pokemon Castor & Pollux, the two twins of the Gemini.
    - "Pure" menu GUI (non-battle menus)
    - Overworld
    - Standard Pokemon data format for easy creation of new 'mons
    - Battling system
    
    NOTES:
    - Overlevelling will be impossible; trainer teams will be boosted to match yours if
        their average level is lower than yours. (Maybe only in the Proof Points? Or everywhere?)
        - Basic formula:
            playerAverage = sum(player.pokemonLevels) / size(player.pokemon)
            trainerAverage = sum(trainer.pokemonLevels) / size(trainer.pokemon)
            toAdd = max(0, playerAverage - trainerAverage);
            foreach (tainer.pokemon as poke) { poke.level += toAdd; }

   MUSIC:
    Intro Cutscene - "Crossing the Rubicon" & "Valentine #1" by Avgvista from OpenGameArt.org
    Obsolete Intro - "What a Nice Surprise" by Snabisch of OpenGameArt.org
    
    SOUND EFFECTS:
    Ripped from Pokemon FireRed, copyright GameFreak, Nintendo, Pokemon Company, etc.
    
    SPRITES:
    Professor Hawthorne by HoboJoe0858 of DeviantArt.com
    Nagon by Pokekoks of DeviantArt.com
    
*/
