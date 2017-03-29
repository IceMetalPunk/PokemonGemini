/// gui_draw_battle_menu(index)
/* Syntax: void gui_draw_battle_menu(real index)

Arguments:
index - The index of the frame to use (0=black, 1=other, etc.)
*/

// Draw boxes
gui_draw_box(0, room_height-128, argument0, room_width, 128, c_white);
gui_draw_box(MENU_X, room_height-128, argument0, room_width - MENU_X, 128, c_white);

// Advance message
if (BattleMenu.message_pos < string_length(BattleMenu.message)) {
    BattleMenu.message_pos+=Settings.TEXT_SPEED;
    if (string_char_at(BattleMenu.message, BattleMenu.message_pos)==" ") {
        ++BattleMenu.message_pos;
    }
}

// Draw "continue" triangle
else {
    BattleMenu.message_pos = string_length(BattleMenu.message);
    if (!ds_queue_empty(BattleMenu.messages)) {
        var yoffset = 2*sin(get_timer() / 100000);
        draw_triangle_colour(8, room_height - 14 - yoffset, 13, room_height - 7 - yoffset, 18, room_height - 14 - yoffset, c_black, c_black, c_black, false);
    }
}

// Draw the message text
draw_set_font(global.MENU_FONT);
draw_text_ext(8, room_height-122, string_copy(BattleMenu.message, 1, BattleMenu.message_pos), -1, MENU_X - 16);

// Draw the menu text
if (!is_undefined(BattleMenu.menuOptions)) {
    var optionXPad = 4;
    var xoff = optionXPad, yoff = 0, len = array_height_2d(BattleMenu.menuOptions);
    var perRow = ceil(sqrt(len));
    draw_set_font(global.OPTION_FONT);
    
    var ocol = draw_get_color();
    if (BattleMenu.message != "") {
        draw_set_color(c_gray);
    }
    
    for (var i = 0; i < len; ++i) {
        if (i != 0) {
            if((i % perRow) == 0) { yoff += string_height("F") + 10; xoff = optionXPad; }
            else { xoff += string_width(BattleMenu.menuOptions[i-1, 0]) + 10; }
        }
        draw_text(MENU_X + 4 + xoff, room_height - 122 + yoff, BattleMenu.menuOptions[i, 0]);
        if (BattleMenu.message == "" && BattleMenu.chosenOption == i) {
            draw_triangle(MENU_X + xoff, room_height - 122 + yoff, MENU_X + xoff, room_height - 122 + yoff + string_height("T"), MENU_X + xoff + 5, room_height - 122 + yoff + string_height("T")/2, false);
        }
    }
    
    draw_set_color(ocol);
}