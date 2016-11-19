///scrShootAngle(direction, obj, angle)
if (bullet_timer >= m_bullet_timer) {
        //reset timer
        bullet_timer = 0
    
        //shoot from the right side
        var xoff = bullet_offset_x * bullet_which
        
        //shoot
        var b = instance_create(x + xoff, y + argument0*bullet_offset_y, argument1);
        b.hsp = lengthdir_x(bullet_speed, argument2)
        b.vsp = lengthdir_y(bullet_speed, argument2)      
        b.image_angle = point_direction(0, 0, b.hsp, b.vsp)
        
        //switch side
        bullet_which *= -1
    }
