///scrBossAI_3()

//default -> gotoleft -> shoot -> spawn -> default

p = instance_nearest(x, y, attack_target)
switch (attack_state) {
    
    case "default":
        //increase state timer
        attack_timer++
        if (rage) {attack_timer++}
        if (attack_timer > timer_default) {
            attack_timer = 0
            attack_state = "chargelaser"
        }
        
        //follow player
        if (instance_exists(p)) {
            x = lerp(x, p.x, attack_speed_default)
        }
    break
    
    case "chargelaser":
        x += sin(current_time / 25) * 1
        
        //follow player
        if (instance_exists(p)) {
            x = lerp(x, p.x, attack_speed_fire / 2)
        }
        
        //increase state timer
        attack_timer++
        if (rage) {attack_timer += 0.5}
        if (attack_timer > timer_charge) {
            attack_timer = 0
            attack_state = "firelaser"
        }
    break

    case "firelaser":
        x += sin(current_time / 10) * 2
        y = lerp(y, pref_height, pref_height_spd)
        
        //follow player
        if (instance_exists(p)) {
            if (rage) {
                x = lerp(x, p.x, attack_speed_fire / 2)
            } else {
                x = lerp(x, p.x, attack_speed_fire)
            }
        }
        
        //increase state timer
        attack_timer++
        if (rage) {attack_timer -= 0.2}
        if (attack_timer > timer_fire) {
            attack_timer = 0
            attack_state = "gotomiddle"
        }
    break
    
    case "gotomiddle":
        // Go to middle left
        if (rage) {
            x = lerp(x, (room_width/2) + sin((attack_timer-timer_wait) / 80) * 200, attack_speed_default)
        } else {
            x = lerp(x, room_width * 0.33, attack_speed_default)
        }
        
        // Done
        if (distance_to_point(room_width * 0.33, y) < 5 or rage) {
            attack_timer++
            if (attack_timer > timer_wait) {
                attack_timer = 0
                attack_state = "bigshot"
            }
        }
    break
    
    case "bigshot":
        if (rage) {
            x = lerp(x, (room_width/2) + sin(attack_timer / 80) * 200, 0.2)
        }
    
        if (random(1) < 0.9 and (attack_timer < timer_bigshot * 0.45 or attack_timer > timer_bigshot * 0.55)) {
            var xx = x
            var yy = y
            if (attack_timer > timer_bigshot / 2) {
                xx = connected.x
                yy = connected.y
            }
            bullet_timer = m_bullet_timer
            with (scrShoot(1, oBulletEnemy)) {
                x = xx
                y = yy + 16
                if (other.attack_stage == 0) {
                    if (random(1) < 0.5) {
                        hsp = random_range(-1.4, -0.8) * other.bullet_speed
                    } else {
                        hsp = random_range(0.8, 1.4) * other.bullet_speed
                    }
                } else {
                    hsp = random_range(-1.3, 1.3)
                }
            }
        }
        
        //increase state timer
        attack_timer++
        if (attack_timer > timer_bigshot) {
            attack_timer = 0
            attack_state = "default"
            attack_stage = 1 - attack_stage
        }
    break
}
