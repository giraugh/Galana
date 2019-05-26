///scrBossAI_1()

//default -> gotoleft -> shoot -> spawn -> default

p = instance_nearest(x, y, attack_target)

switch (attack_state) {
    
    case "default":
        //increase state timer
        attack_timer++
        if (attack_timer > timer_default) {
            attack_timer = 0
            attack_state = "gotoleft"
        }
        
        //follow player
        if (instance_exists(p)) {
            x = lerp(x, p.x, attack_speed_default)
        }
    break
    
    case "gotoleft":
        x = lerp(x, 32, attack_speed_default * 1.2)
        attack_timer++
        if (attack_timer > timer_move) {
            attack_timer = 0
            attack_state = "shootright"
        }
    break
    
    case "gotoright":
        x = lerp(x, room_width-32, attack_speed_default * 1.2)
        attack_timer++
        if (attack_timer > timer_move) {
            attack_timer = 0
            attack_state = "shootleft"
        }
    break

    case "shootright":
        //shoot
        scrShoot(1, oBulletEnemy)
        
        //increase timer
        bullet_timer++
        
        //finished?
        if (x > room_width - 90) {
            attack_timer = 0
            attack_state = "spawn"
        }
        
        //go to right
        if (instance_exists(p)) {
            x += 3.5
        }
    break
    
        case "shootleft":
        //shoot
        scrShoot(1, oBulletEnemy)
        
        //increase timer
        bullet_timer++
        
        //finished?
        if (x < 90) {
            attack_timer = 0
            attack_state = "spawn"
        }
        
        //go to left
        if (instance_exists(p)) {
            x -= 3.5
        }
    break
    
    case "spawn":
        //go half way to player
        x = lerp(x, room_width/2, attack_speed_spawn)
        if (instance_exists(p)) {x = lerp(x, p.x, attack_speed_spawn * 0.75)}
        
        //increase spawning timer
        spawn_timer ++
        
        //spawn enemies
        if (spawn_timer > spawn_delay) {
            //reset timer
            spawn_timer = 0
        
            //spawn enemy
            en = instance_create(0, 0, oEnemy)
            
            //set its pos (it defaults to above the screen)
            en.x = x + (choose(-1, 1)*55)
            en.y = y + 55
            
            //set its type
            en.type = 1
            
            //reduce screen shake on them
            en.shake_amount = 5
        }
        
        //leave some more room
        y = lerp(y, pref_height / 2, pref_height_spd * 1.3)
        
        //increase state timer
        attack_timer++
        if (attack_timer > timer_spawn) {
            attack_timer = 0
            attack_state = choose("gotoleft", "gotoright")
        }
    break

}

//start to float if flashing
if ((attack_state == "gotoleft" or attack_state == "gotoright") and attack_timer > (timer_default - 20)) {
    x += irandom_range(-4, 4)
}
