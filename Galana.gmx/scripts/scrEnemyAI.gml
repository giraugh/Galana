///scrEnemyAI(type)

if (instance_exists(attack_target)) {
    p = instance_nearest(x, y, attack_target)
    switch (argument0) {
        //First type -----------------------------------------------------------------------------------------------------------------
        //Chases player whilst staying at a distance and shooting
        case 0:
            //shooting--------------------------------
            //shoot
            scrShoot(1, oBulletEnemy)
            
            //increase timer
            bullet_timer++
        
            //go to preferred height------------------
            y = lerp(y, pref_height, pref_speed)
            
            //follow target----------------------------
            
            //go to its x pos
            x = lerp(x, p.x + attack_offset, attack_speed)
            
        break
        
        //Second Type ------------------------------------------------------------------------------------------------------------------
        //Slowly move towards x whilst moving down
        case 1:
            dir = point_direction(x, y, p.x, p.y + 16)
            x += lengthdir_x(3, dir)
            y += max(3, lengthdir_y(3, dir))
        break
    
        //Third Type --------------------------------------------------------------------------------------------------------------------
        //Follows player till its in line then dives player
        case 2:
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
            
        break
        
        //Fourth Type --------------------------------------------------------------------------------------------------------------------
        //Goes to pref height and avoids player on x, creates a shield which makes other enemies invulnerable
        case 3:
            //go to preferred height------------------
            y = lerp(y, pref_height, pref_speed)
            
            //avoid x----------------------------
            if (p.x > x) {
                x = lerp(x, 64 + attack_speed, attack_speed)
            }
            
            if (p.x < x) {
                x = lerp(x, room_width - 64 - attack_speed, attack_speed)
            }
            
            //lets make nearby people invincible!
            with (oEnemy) {
                //if im not the one granting invincibility
                if (id != other.id) {
                    is_invincible = true
                }
            }
            
        break
        
    }
}
