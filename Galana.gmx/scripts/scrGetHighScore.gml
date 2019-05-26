///scrGetHighScore()

var number_runs = scrGetNumberRuns()

var highest_score = -1

for (i = 1; i <= number_runs; i++) {
    var run_score = scrGetRunScore(i)
    if run_score > highest_score {
        highest_score = run_score
    }
}

return highest_score
