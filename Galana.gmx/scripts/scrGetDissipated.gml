///scrGetDissipated()

//create it
obj = instance_create(x, y, oDissipatedBullet)

//Make the dissipate bullet bigger?
if (object_get_name(id) == "oBulletBoss") {
    obj.sprite = sBoss_Bullet_Dissipate
}

//rotate it
obj.image_angle = image_angle

//die
instance_destroy()
