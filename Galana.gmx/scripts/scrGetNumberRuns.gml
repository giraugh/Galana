///scrGetNumberRuns()

// Open File
ini_open("runs.ini")

// Get number of this run
var num = ini_read_real("stats", "number_of_runs", 0)

// Close File
ini_close()

return num
