///scrWaveFinished()

//destroy us
instance_destroy()

//give score
scrGiveScore(50)

//do we have a boss to spawn?
if (boss_to_spawn != noone) {
    //spawn boss
    /*SPAWN BOSS*/
    var boss = instance_create(boss_spawn_loc_x, boss_spawn_loc_y, boss_to_spawn);
    boss.wave_next = wave_next
} else {
    //go to next wave
    instance_create(0, 0, wave_next)
}
