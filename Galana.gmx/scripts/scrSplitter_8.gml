///scrSplitter_8()

image_speed = 0

// Move towards player
dir = point_direction(x, y, p.x, p.y + 16)
x += lengthdir_x(1, dir) * 0.75
y += 2.5


// Split into two
if (y > (room_height * 0.5)) {
    var a = instance_create(0, 0, object_index);
    var b = instance_create(0, 0, object_index);
    a.x = x - 1
    b.x = x + 1
    a.y = y
    b.y = y
    a.seed = 100 + random(300)
    b.seed = 100 + random(300)
    a.type = ENEMY_CHASER
    b.type = ENEMY_CHASER
    a.s_override = true
    b.s_override = true
    a.s_over = sEnemy_9
    b.s_over = sEnemy_9
    a.s_index = 1
    b.s_index = 2
    a.fire_enabled = false
    b.fire_enabled = false
    a.slow_roll = random_range(-0.5, 0.5)
    b.slow_roll = random_range(-0.5, 0.5)
    a.hth = 1
    b.hth = 1
    instance_destroy()
}
