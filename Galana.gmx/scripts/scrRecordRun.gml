///scrRecordRun(wave, score, lap)

// Open File
ini_open("runs.ini")

// Get number of this run
var num = 1 + ini_read_real("stats", "number_of_runs", 0)

// Write information
ini_write_real("run-" + string(num), "score", argument1)
ini_write_real("run-" + string(num), "wave", argument0)
ini_write_real("run-" + string(num), "lap", argument2)
ini_write_real("run-" + string(num), "date", date_current_datetime())

// Update Number of runs
ini_write_real("stats", "number_of_runs", num)

// Close File
ini_close()
