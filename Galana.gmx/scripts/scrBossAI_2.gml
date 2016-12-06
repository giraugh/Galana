///scrBossAI_1()

p = instance_nearest(x, y, attack_target)

switch (attack_state) {
    
    case "default":
        //increase state timer
        attack_timer++
        if (attack_timer > timer_default) {
            attack_timer = 0
            attack_state = "shoot"
        }
        
        //follow player
        if (instance_exists(p)) {
            x = lerp(x, p.x, attack_speed_default)
        }
    break

    case "shoot":
        //shoot
        scrShoot(1, oBulletEnemy)
        
        //increase timer
        bullet_timer++
        
        //increase state timer
        attack_timer++
        if (attack_timer > timer_shoot) {
            attack_timer = 0
            attack_state = "spawn"
        }
        
        //follow player
        if (instance_exists(p)) {
            x = lerp(x, p.x, attack_speed_shoot)
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
        
        //increase state timer
        attack_timer++
        if (attack_timer > timer_spawn) {
            attack_timer = 0
            attack_state = "default"
        }
    break

}
