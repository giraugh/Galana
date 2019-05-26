///cbkMenuButtonPressed(type)

switch (argument0) {
    case "play":
        instance_create(0, 0, oSwipeFade)
    break
    
    case "pause_continue":
        room_goto(global.RoomBeforePause)
    break
    
    case "pause_quit":
        global.PauseAction = "quit"
        room_goto(global.RoomBeforePause)
    break
    
    case "useless":
        // Go to scores room
        var sf = instance_create(0,0, oSwipeFade);
        sf.room_to_goto = SCORES
        sf.rect_colour = COL_ENEMY_LIGHT
        sf.other_side = true
    break
    
    case "scores_back":
        var sf = instance_create(0,0, oSwipeFade);
        sf.room_to_goto = MENU
        sf.rect_colour = COL_ENEMY_LIGHT
    break
}

//Goto Wave
if (string_char_at(argument0,1) == "w") {
    //set the globalvar
    startwave = string_char_at(argument0, 2)
    startwave = asset_get_index("oWave"+startwave)
    cbkMenuButtonPressed("play")
}

