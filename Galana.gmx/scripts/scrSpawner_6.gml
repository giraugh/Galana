// Warp in
y = lerp(y, pref_height - 16, pref_speed)
if (y < pref_height - 15) scrCreateTrail()

// Subtle travelling
x = (((sin((current_time + 300 * seed) / 4000)+1)/2) * room_width * 0.8) + (room_width * 0.1)

espawn_timer++
if espawn_timer >= espawn_timer_m and espawned <= espawn_m {
    espawn_timer = 0
    espawned++
    
    //spawn enemy
    en = instance_create(0, 0, oEnemy)
    
    //set its pos (it defaults to above the screen)
    en.x = x
    en.y = y + 8
    
    //set its type
    en.type = 1
    
    //reduce screen shake on them
    en.shake_amount = 4
    
    //move up as if I shot it
    y -= 10
}
