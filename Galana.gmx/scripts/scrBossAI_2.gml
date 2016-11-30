///scrBossAI_2()

p = instance_nearest(x, y, attack_target)

switch (attack_state) {
    
    case "default":
        //go to pref height
        y = lerp(y, pref_height, pref_height_spd)
        
        //track x
        if (instance_exists(p)) {
            x = lerp(x, p.x, attack_speed)
        }
        
        //increase state timer
        attack_timer++
        if (attack_timer > timer_default) {
            attack_timer = 0
            attack_state = "dive"
        }
                
        
    break
        
    case "default_enraged":
        //go to pref height
        y = lerp(y, pref_height, pref_height_spd)
        
        //track x
        if (instance_exists(p)) {
            x = lerp(x, p.x, attack_speed)
        }
        
        //increase state timer
        attack_timer++
        if (attack_timer > timer_default/2) {
            attack_timer = 0
            attack_state = "dive_enraged"
        }
    break

    case "dive":
        //Actually Dive
        y += dive_speed
        
        //Go back?
        if (y > room_height + (sprite_width)) {
            attack_state = "return"
        }
        
    break
    
    case "dive_enraged":
        //Actually Dive
        y += dive_speed+5
        
        //Go back?
        if (y > room_height + (sprite_width)) {
            attack_state = "return"
        }
        
    break
    
    case "return":
        //just go back for now
        y = lerp(y, pref_height, pref_height_spd + .3)
        
        if (round(y) == pref_height) {
            if (hth < hth_max/2) {
                attack_state = "default_enraged"
            } else {
                attack_state = "default"
            }
        }
        
    break
    
}
