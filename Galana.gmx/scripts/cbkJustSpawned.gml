///cbkJustSpawned(type, object)

var obj = argument1

switch (argument0) {

    case "generic":
    
    break
    
    case "enemy":
        //random x
        obj.x = random(room_width-32)+32
        
        //random type
        if (can_spawn != undefined) {
            obj.type = choose_array(can_spawn)
        } else {show_debug_message(object_get_name(object_index) + ": can_spawn IS UNDEFINED")}
        
        // One-of enemy types
        if ((obj.type == ENEMY_SHIELDER and scrGetEnemyCount(ENEMY_SHIELDER) > 1) or
            (obj.type == ENEMY_SPAWNER and scrGetEnemyCount(ENEMY_SPAWNER) > 1) or
            (obj.type == ENEMY_TELEKINETIC and scrGetEnemyCount(ENEMY_TELEKINETIC) > 1)) {
            
            //delete me
            with (obj){instance_destroy()}
            
            //set spawner alarm to go straight away at a time
            alarm[0] = 1
        
            return 0
        }
        
        // Mini-boss enemies
        if (obj.type == ENEMY_TELEKINETIC) {
            obj.hth = 5
        }
        
    break

    default:
        show_debug_message("Unknown callback '" + string(type) + "'")
    break

}
