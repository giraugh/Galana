//go to preferred height------------------
y = lerp(y, pref_height, pref_speed)

//avoid x----------------------------
if (p.x > x) {
    x = lerp(x, 64 + attack_speed, attack_speed / 3)
}

if (p.x < x) {
    x = lerp(x, room_width - 64 - attack_speed, attack_speed / 3)
}

//lets make nearby people invincible!
with (oEnemy) {
    if (other.health_given < 3) {
        //if im not the one granting invincibility
        if (!got_extra_health) {
            got_extra_health = true
            giving_health = other
            hth += bonus_health
            other.health_given += 1
        }
    }
}

//are we done healing? fly away
if (health_given >= 3) {
    //noone is recieving our benefit?
    var they_are = false
    with (oEnemy) {
        if (type != 3) {
            if (got_extra_health and giving_health = other) {
                they_are = true
            }
        }
    }
    
    //If they arent fly away
    if (!they_are) {
        y += 2
        pref_speed = 0
    }
}
            
