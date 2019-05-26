if (state == "dive") {
    //dive------------------------
    
    //re-enabled fire
    fire_enabled = true
    
    //move
    y += dive_speed
}
if (state == "pause") {
    //disable fire
    fire_enabled = false

    //set sprite to transform sprite (requires override)
    sprite_index = dive_transform_sprite
    image_speed = .2
    s_override = true
    s_over = dive_transform_sprite
    
    //drift
    y -= 1
    
    //are we finished transforming?
    if (image_index >= image_number-1) {
        sprite_index = dive_sprite
        s_over = dive_sprite
        state = "dive"
    }
}
if (state == "default") {
    
    //should we dive?--------------------------
    //are we in line (and at least at pref height)? and just dive after a while aswell
    if (life > dive_give_up or (abs(p.x - x) < dive_distance and round(y) >= pref_height)) {
        state = "pause"
        image_index = 0
    }      
    
    //go to preferred height------------------
    y = lerp(y, pref_height, pref_speed)
    
    
    //follow target----------------------------
    
    //go to its x pos
    x = lerp(x, p.x + attack_offset, attack_speed)
}
            
