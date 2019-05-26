///scrGetRunScore(number)

// Open File
ini_open("runs.ini")

var key = "run-" + string(argument0);
var s = ini_read_real(key, "score", 0)

// Close File
ini_close()

return s
