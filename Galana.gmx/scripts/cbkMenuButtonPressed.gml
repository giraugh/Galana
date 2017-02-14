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
        show_message("if you know what this button should do, tell me.")
    break
}

//Goto Wave
if (string_char_at(argument0,1) == "w") {
    //set the globalvar
    startwave = string_char_at(argument0, 2)
    startwave = asset_get_index("oWave"+startwave)
    cbkMenuButtonPressed("play")
}

