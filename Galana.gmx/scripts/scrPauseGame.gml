///scrPauseGame()

// create a screenshot of application surface
global.PauseScreenShot = sprite_create_from_surface(
    application_surface,
    0, 0,
    surface_get_width(application_surface), 
    surface_get_height(application_surface),
    false,
    false,
    0, 0);
    
//set room persistence to true
room_persistent = true

//save this room
global.RoomBeforePause = room

//goto to pause room
room_goto(PAUSE)
