///scrUnpausedGame()

//delete room
if (global.RoomBeforePause != -1) {
    global.RoomBeforePause = -1;

    //delete pause snapshot sprite
    sprite_delete(global.PauseScreenShot);
    
    //no longer persistent
    room_persistent = false
    
    //check action
    if (global.PauseAction == "quit") {
        room_goto(menuroom)
    }
}
