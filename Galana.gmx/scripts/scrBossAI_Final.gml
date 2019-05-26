///scrBossAI_Final()

p = instance_nearest(x, y, attack_target)

switch (attack_state) {
    case "wait":
        //increase state timer
        if instance_number(oBossSubFinal) == 0 {
            attack_timer++
        }
        if (attack_timer > timer_wait) {
            attack_timer = 0
            attack_state = "default"
        }
    break

    case "default":
        shield = true
        x = lerp(x, room_width / 2, .1)
    
        attack_timer++
        if (attack_timer > timer_default) {
            attack_timer = 0
            attack_state = choose("rain", "shoot_ccw", "shoot_cw", "circle")
        }
    break
    
    case "rise":
        y = lerp(y, pref_height - 100, .1)
        x += random_range(-1, 1)
        x = lerp(x, room_width/2, .1)
        
        attack_timer++
        if (attack_timer > timer_rise) {
            attack_timer = 0
            attack_state = "spawn"
        }
    break
    
    case "spawn":
        if attack_timer == 0 {
            var n = 16
            for (i = 0; i < n; i++) {
                var xx = (room_width/n) * (i+.5);
                var yy = pref_height;
                en = instance_create(xx, yy, oEnemy)
                en.type = ENEMY_CHASER
                en.stay_put = true
                en.stay_put_x = xx
            }
        }
        
        attack_timer++
        if (attack_timer > timer_spawn) {
            attack_timer = 0
            attack_state = "default"
        }
    break
    
    case "circle":
        if (bullet_timer >= m_bullet_timer) {
            bullet_timer = 0
            var n = 30
            for (i = 0; i < n; i++) {
                var an = 360 / n * i;
                var b = instance_create(
                    x + lengthdir_x(50, an),
                    y + lengthdir_y(50, an),
                    oBulletEnemy
                );
                b.hsp = lengthdir_x(3, an)
                b.vsp = lengthdir_y(3, an)
                b.image_angle = point_direction(0,0,b.hsp,b.vsp)
            }
        }
        
        bullet_timer += .3
        
        //increase state timer
        attack_timer++
        if (attack_timer > timer_circle) {
            attack_timer = 0
            attack_state = "default"
        }
    break
    
    case "rain":
        // Create bullet rain
        var n = 4
        if attack_timer == 0 {shoot_gap = floor(random_range(0, n))}
        shooting_angle = shooting_angle % 360
        if (attack_timer > room_speed * .6 and timer_rain - attack_timer > room_speed * .5) {
            if (bullet_timer >= m_bullet_timer) {
                bullet_timer = 0
                for (i = 0; i < n; i++) {
                    if i != shoot_gap {
                        var ww = (room_width/n)
                        var bn = 10
                        if (rage) {bn = 15}
                        for (j = 0; j < bn; j++) {
                            var b = instance_create(
                                (i * ww) + random_range(0, ww),
                                0,
                                oBulletEnemy
                            );
                            b.hsp = 0
                            b.vsp = 5
                            if rage { b.vsp = 10 }
                            b.image_angle = 270
                        }
                    }
                }
            }
        }
        
        // Indicate safe spot
        x = lerp(x, (shoot_gap + .5) * (room_width)/n, .2)
        y = lerp(y, pref_height - 64, .2)
        
        // Increment bullet timer
        bullet_timer++ 
        
        //increase state timer
        attack_timer++
        if (attack_timer > timer_rain) {
            attack_timer = 0
            attack_state = "default"
        }
    break
    
    case "shoot_cw":
        shoot_rot_direction = 1
        attack_state = "shoot"
        shooting_angle = 0
    break
    
    case "shoot_ccw":
        shoot_rot_direction = -1
        attack_state = "shoot"
        shooting_angle = 45
    break
    
    case "shoot":
        shooting_angle = shooting_angle % 360
        if (bullet_timer >= m_bullet_timer) {
            bullet_timer = 0
            var n = 6
            if (rage) {n = 5}
            if (attack_timer/timer_shoot < .5) {
                shooting_angle += 3.5 * shoot_rot_direction
                if (rage) {shooting_angle += .5 * shoot_rot_direction}
            } else {
                shooting_angle -= 3.5 * shoot_rot_direction
                if (rage) {shooting_angle -= .5 * shoot_rot_direction}
            }
            for (a = 0; a < n; a++) {
                var an = shooting_angle + (360 / n * a);
                var b = instance_create(
                    x + lengthdir_x(50, an),
                    y + lengthdir_y(50, an),
                    oBulletEnemy
                );
                b.hsp = lengthdir_x(3, an)
                b.vsp = lengthdir_y(3, an)
                b.image_angle = point_direction(0,0,b.hsp,b.vsp)
            }
        }
        
        bullet_timer++
        if (rage) {bullet_timer++}
        
        if (rage) {
            x += random_range(-1, 1)
            
            // Create pulse
            with (oBulletEnemy) {
                var dir = point_direction(0, 0, hsp, vsp);
                var len = point_distance(0, 0, hsp, vsp);
                len = 2 * sin(current_time / 60) + 5
                hsp = lengthdir_x(len, dir)
                vsp = lengthdir_y(len, dir)
            }
        }
        
        //increase state timer
        attack_timer++
        if (attack_timer > timer_shoot) {
            attack_timer = 0
            attack_state = "default"
        }
    break
}
