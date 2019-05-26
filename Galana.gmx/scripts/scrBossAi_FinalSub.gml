///scrBossAi_FinalSub

p = instance_nearest(x, y, attack_target)
var time_delay = (.1 * room_speed * (x/100));

switch (attack_state) {
    case "wait":
        //increase state timer
        attack_timer++
        if (attack_timer > timer_wait + time_delay) {
            attack_timer = 0
            attack_state = "default"
        }
    break

    case "default":
    
        y = lerp(y, pref_height - 16, .4)
        x += random_range(-1, 1)
    
        //increase state timer
        attack_timer++
        if (attack_timer > timer_default + time_delay) {
            attack_timer = 0
            attack_state = "slam"
        }
    break
    
    case "slam":        
        y = lerp(y, room_height + 64, .2)
        
        //increase state timer
        attack_timer++
        if (rage) {attack_timer++}
        if (attack_timer > timer_slam + time_delay / 2) {
            attack_timer = 0
            attack_state = "rise"
        }
    break
    
    case "rise":
         y = lerp(y, pref_height, .3)
        
        //increase state timer
        attack_timer++
        if (rage) {attack_timer++}
        if (attack_timer > timer_rise + time_delay) {
            attack_timer = 0
            if (random_range(0,1) < .5) {
                attack_state = "default"
            } else {
                attack_state = "spawn"
            }
        }
    break
    
    case "spawn":
        
        //increase spawning timer
        if (rage) {spawn_timer += 0.5}
        spawn_timer++
        
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
            en.type = ENEMY_SPLITTER
            
            //reduce screen shake on them
            en.shake_amount = 5
        }
        
        //increase state timer
        attack_timer++
        if (rage) {attack_timer++}
        if (attack_timer > timer_spawn + time_delay) {
            attack_timer = 0
            attack_state = "default"
        }
    break
}
