/// gui_draw_dialogue(index)
/* Syntax: void gui_draw_dialogue(real index)

Arguments:
index - The index of the frame to use (0=black, 1=other, etc.)
*/
gui_draw_box(0, room_height-128, argument0, room_width, 128, c_white);

if (BattleMenu.message_pos < string_length(BattleMenu.message)) {
    BattleMenu.message_pos+=Settings.TEXT_SPEED;
    if (string_char_at(BattleMenu.message, BattleMenu.message_pos)==" ") {
        ++BattleMenu.message_pos;
    }
}
else {
    BattleMenu.message_pos = string_length(BattleMenu.message);
    if (!ds_queue_empty(BattleMenu.messages)) {
        var yoffset = 2*sin(get_timer() / 100000);
        draw_triangle_colour(8, room_height - 14 - yoffset, 13, room_height - 7 - yoffset, 18, room_height - 14 - yoffset, c_black, c_black, c_black, false);
    }
}

draw_set_font(global.MENU_FONT);
draw_text_ext(8, room_height-122, string_copy(BattleMenu.message, 1, BattleMenu.message_pos), -1, room_width - 16);