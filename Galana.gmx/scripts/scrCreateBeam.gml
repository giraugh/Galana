///scrCreateBeam(to, colour, alpha_dec, width, roffset, yoffset)

var to = argument0;
var col = argument1;
var ad = argument2;
var width = argument3;
var roffset = argument4;
var yoffset = argument5;

//create object
line = instance_create(x, y, oInvinciBeam)

//set parent
line.parent = id

//set random offset
line.roffset = roffset

//set y offset
line.yoffset = yoffset

//set alpha decrease
line.alpha_decrease = ad

//set colour
line.draw_colour = col

//set width
line.draw_width = width

//set position
line.draw_to = to
