/// gui_draw_box(x, y, index, w, h[, bgcol])
/* Syntax: void gui_draw_box(real x, real y, real index, real w, real h[, color bgcol])

Arguments:
(x, y) - Location on the screen to draw the box.
index - The index of the frame to use (0=black, 1=other, 2=other, etc.).
(w, h) - The width and height to draw the box.
[bgcol] (Optional) - The background color of the box. If not supplied, it's transparent.
*/
var xx=argument[0], yy=argument[1], index=argument[2], w=argument[3], h=argument[4], bcol=undefined;
if (argument_count==6) {
    bgcol=argument[5];
}
if (argument_count>6 || argument_count<5) {
    show_error("Invalid number of arguments to gui_draw_box. Must be 5 or 6.", true);
    return false;
}

var xscale=w/sprite_get_width(SprGuiBox), yscale=h/sprite_get_height(SprGuiBox);
if (!is_undefined(bgcol)) {
    draw_roundrect_colour_ext(xx, yy, xx+w, yy+h, 40, 40, bgcol, bgcol, false);
}
draw_sprite_ext(SprGuiBox, index, xx, yy, xscale, yscale, 0, c_white, 1);

return true;