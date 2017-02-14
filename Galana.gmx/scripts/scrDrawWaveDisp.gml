///scrDrawWaveDisp(wave_count, cur_wave, player_sprite, gui_colour)

var wave_count = argument0,
    cur_wave = argument1, //Change this to change the player position
    wave_disp_circ_radius = 9,
    wave_disp_circ_enlarge = 1.5,
    wave_disp_line_width = 5,
    wave_disp_segment_length = 64;
    
var cur = 1;
repeat(wave_count) {
    //define vars
    var x1, y1, x2, y2, rad;
    x1 = cur * wave_disp_segment_length
    x2 = x1 + wave_disp_segment_length
    y1 = 64
    y2 = 64
    rad = wave_disp_circ_radius
    
    //set colour
    draw_set_color(argument3)
    
    //draw next segment if not last
    if (cur != wave_count)
    draw_line_width(x1, y1, x2, y2, wave_disp_line_width)
    
    //enlarge circle if its our current one
    if (cur == cur_wave)
    rad *= wave_disp_circ_enlarge
    
    //draw circle
    draw_circle(
        x1,
        y1,
        rad,
        false)
        
    //draw sprite
    if (cur == cur_wave) {
        var spx, spy;
        spx = x1
        spy = y1 - 16 + (3 * sin(current_time / 400))
        draw_sprite(argument2, 0, spx, spy)
    }
    cur++
}
