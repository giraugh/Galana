///scrWaveFinished()

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
