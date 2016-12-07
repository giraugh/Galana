///scrMobileInputGetAccX()
if (display_get_orientation() == display_landscape) {
   return device_get_tilt_y() * scrMobileInputSens();
} else {
   return device_get_tilt_x() * scrMobileInputSens();
}
