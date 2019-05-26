//first time jump to left
if (state == "default") {
    state = "move"
    x = 0
} else {

    //go to preferred height------------------
    y = lerp(y, pref_height + (sin(current_time / 300) * 10), pref_speed)

    //move right----------------------------
    x += mrspd
    
    //shoot-----------------------------
    scrShoot(1, oBulletEnemy)
    
    //increase timer
    if (sin((current_time + seed) / 100) > 0) {
        bullet_timer++
    }
}
