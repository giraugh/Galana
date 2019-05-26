// Go to spot
y = lerp(y, pref_height, pref_speed)
x = lerp(x, room_width / 2, pref_speed)

// Telekinesis!
with (oEnemy) {
    // Create trails
    with (scrCreateTrail()) {
        image_blend = COL_ENEMY_PURPLE_DARK
    }

    // Wave up and down
    if (id != other.id) {
        y += sin(other.life / 10) * 3
    } else {
        y += sin(life / 10)
    }
}
