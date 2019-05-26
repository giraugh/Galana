//has a slower shooting speed
m_bullet_timer = 25

//shooting--------------------------------
//shoot
scrShoot(1, oBulletEnemy)

//increase timer
bullet_timer++

//go to preferred height------------------
y = lerp(y, pref_height, pref_speed)

//follow target----------------------------

//go to its x pos
x = lerp(x, p.x + attack_offset, attack_speed)
