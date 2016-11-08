///scrCameraShake(amountX, amountY)

//on the camera object

with (oCamera) {
    //apply it
    shake_x += argument0
    shake_y += argument1
    
    //now limit it
    if (shake_x > shake_limit or shake_y > shake_limit) {
        shake_x = shake_limit;
        shake_y = shake_limit;
    }
}
