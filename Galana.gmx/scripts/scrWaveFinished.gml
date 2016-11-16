///scrWaveFinished()

//show wave completed text
var text = instance_create(room_width/2, room_height/2, oWaveCompleted);
text.text_content = "Wave " + string(wave_number) + " Completed"

//destroy us
instance_destroy()

//do we have a boss to spawn?
if (boss_to_spawn != noone) {
    //spawn boss
    /*SPAWN BOSS*/
} else {
    //go to next wave
    instance_create(0, 0, wave_next)
}
