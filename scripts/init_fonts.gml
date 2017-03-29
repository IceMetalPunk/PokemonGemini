/// init_fonts()
/* Syntax: void init_fonts()

Arguments: (None)

Notes: Loads external fonts into the game into global variables.
*/
global.MENU_FONT = font_add("pokemon_bw.ttf", 24, false, false, 0, 255); // XXX: Doesn't have parentheses... not sure why...
global.OPTION_FONT = font_add("pokemon_bw.ttf", 28, true, false, 0, 255); // XXX: Doesn't have parentheses... not sure why...