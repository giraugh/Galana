///scrEnemyAI(type)

if (instance_exists(attack_target)) {
    p = instance_nearest(x, y, attack_target)
    switch (argument0) {
        //First type -----------------------------------------------------------------------------------------------------------------
        //Chases player whilst staying at a distance and shooting
        case ENEMY_TRACKER:
            scrTracker_0()
        break
        
        //Second Type ------------------------------------------------------------------------------------------------------------------
        //Slowly move towards x whilst moving down
        case ENEMY_CHASER:
            scrChaser_1()
        break
    
        //Third Type --------------------------------------------------------------------------------------------------------------------
        //Follows player till its in line then dives player
        case ENEMY_DIVER:
            scrDiver_2()
        break
        
        //Fourth Type --------------------------------------------------------------------------------------------------------------------
        //Goes to pref height and avoids player on x, creates a shield which increases other enemies health
        case ENEMY_SHIELDER:
            scrShielder_3()
        break
        
        //Fifth Type ------------------------------------------------------------------------------------------------------------------------
        //Travels across screen whilst shooting down
        case ENEMY_TRAVELLER:
            scrTraveller_4()
        break
        
        // Dives straight down, if it leaves screen it does damage to player
        case ENEMY_EXPLODER:
            scrExploder_5()
        break
        
        // Spawns Chasers
        case ENEMY_SPAWNER:
            scrSpawner_6()
        break
        
        // Pushes enemies / player around
        case ENEMY_TELEKINETIC:
            scrTelekinetic_7()
        break
        
        case ENEMY_SPLITTER:
            scrSplitter_8()
        break
        
    }
}
