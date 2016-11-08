///cbkJustSpawned(type, object)

var obj = argument1

switch (argument0) {

    case "generic":
    
    break
    
    case "enemy":
        //random x
        obj.x = random(room_width-32)+32
        
        //random type
        obj.type = irandom_range(0, array_length_1d(obj.types)-1)
        
        //dont spawn more than one "type 4" enemy
        if (obj.type == 3 and scrGetEnemyCount(3) > 1) {
            //delete me
            with (obj){instance_destroy()}
            
            //set spawner alarm to go straight away
            alarm[0] = 1
        }
        
    break

    default:
        show_debug_message("Unknown callback '" + string(type) + "'")
    break

}
