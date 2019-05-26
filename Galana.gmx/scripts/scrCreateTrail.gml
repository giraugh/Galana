///scrCreateTrail()
t = instance_create(x, y, oTrail)
t.draw = sprite_index
t.image_angle = image_angle
t.image_index = image_index

if (object_index == oEnemy) {
    t.draw = types[type]
}

/*
if (s_override) {
    t.draw = s_over
    if (s_index != undefined) {
        t.image_index = s_index
    }
}*/

return t
