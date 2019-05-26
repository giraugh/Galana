///scrBossAI_1()

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
        if (rage) attack_timer++
        if (attack_timer > timer_default) {
            attack_timer = 0
            attack_state = "wait"
        }
                
        
    break

    case "dive":
        //Actually Dive
        y += dive_speed
        if (rage) y+=1
        
        //Go back?
        if (y > room_height + (sprite_width)) {
            y = -sprite_height * 2
            attack_state = "return"
        }
        
        //create trail if rage
        if (rage) scrCreateTrail()
        
    break
    
    case "wait":
        //Wait for timer
        attack_timer++
        if (rage) attack_timer++
        if (attack_timer > timer_wait) {
            attack_timer = 0
            attack_state = "dive"
        }
        
        //Float back
        y -= 3
    break
    
    case "return":
        //just go back for now
        y = lerp(y, pref_height, pref_height_spd + .3)
        
        if (round(y) == pref_height) {
            attack_state = "default"
        }
        
    break
    
}

//start to float if flashing
if (attack_state == "default" and attack_timer > (timer_default - 30)) {
    y -= 1
    if (rage) y -= .5
    x += irandom_range(-4, 4)
}

//rage shake
if (rage) x += irandom_range(-1, 1)
