/// side_solid(x, y, side_mask)

var xpos = argument0, ypos = argument1, mask = argument2;

var tile = tile_layer_find(999999, xpos, ypos);

if (!tile_exists(tile)) {
    return false;
}

var tx = tile_get_left(tile);
tx = (tx div 16);

return (tx & mask) > 0;
