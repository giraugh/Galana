///scrUnpausedGame()

//delete room
if (global.RoomBeforePause != -1) {
    global.RoomBeforePause = -1;

    //delete pause snapshot sprite
    sprite_delete(global.PauseScreenShot);
}
