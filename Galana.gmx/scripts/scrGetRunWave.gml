///scrGetRunWave(number)

// Open File
ini_open("runs.ini")

var key = "run-" + string(argument0);
var w = ini_read_real(key, "wave", 0)

// Close File
ini_close()

return w
