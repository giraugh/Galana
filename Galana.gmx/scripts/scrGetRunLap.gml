///scrGetRunLap(number)

// Open File
ini_open("runs.ini")

var key = "run-" + string(argument0);
var l = ini_read_real(key, "lap", 0)

// Close File
ini_close()

return l
