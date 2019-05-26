///scrDrawRunRecord(x1, y1, x2, y2, index)

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var width = x2 - x1;
var height = y2 - y1;
var margin = 8;

var index = argument4;
var record_score = scrGetRunScore(index);
var record_wave = scrGetRunWave(index);
var record_lap = scrGetRunLap(index);

// Draw background
draw_set_colour(c_white)
draw_rectangle(x1, y1, x2, y2, false)

// Draw text
draw_set_colour(COL_ENEMY_LIGHT)
var yy = y1 + height / 2
draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_text(x1 + margin, yy, string(record_score))
draw_text(x1 + 400, yy, string(record_lap) + " - " + string(record_wave))
