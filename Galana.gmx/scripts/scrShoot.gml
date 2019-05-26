///scrShoot(direction, obj)
if (bullet_timer >= m_bullet_timer) {
        //reset timer
        bullet_timer = 0
        
        //enemy audio (if enemy)
        if (argument0 == 1) {
            scrPlaySound(enemy_shoot)
        }   
    
        //shoot from the right side
        var xoff = bullet_offset_x * bullet_which
        
        //shoot
        var b = instance_create(x + xoff, y + argument0*bullet_offset_y, argument1);
        b.hsp = lengthdir_x(bullet_speed, 90 + image_angle)
        b.vsp = lengthdir_y(bullet_speed, 90 + image_angle)
        b.vsp *= -argument0
        
        //quick kick
        b.image_angle = image_angle - 90
        if (argument0 == -1){b.image_angle = image_angle + 90}
        
        //switch side
        bullet_which *= -1
        
        return b
}
