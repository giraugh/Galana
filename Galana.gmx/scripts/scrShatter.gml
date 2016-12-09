///scrShatter(numPieces)

var width = sprite_get_width(sprite_index),
    height = sprite_get_height(sprite_index),
    c_x = x + width * 0.5,
    c_y = y + height * 0.5,
    i_inc = width / argument0,
    j_inc = height / argument0;
for (var i = 0; i < width; i += i_inc) for (var j = 0; j < height; j += j_inc) {
    with (instance_create(x + i, y + j, oBossChunk)) {
        left = i; top = j; self.width = i_inc; self.height = j_inc; 
        sprite_index = other.sprite_index;
        hspeed = random_range(-10, 10)
        vspeed = random_range(-10, 10)
    }
}
