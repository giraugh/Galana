///lerp_col(col1, col2, t)

var oh, os, ov, nh, ns, nv, h, s, v;

/* OLD */

//h
oh = colour_get_hue(argument0)

//s
os = colour_get_saturation(argument0)

//v
ov = colour_get_value(argument0)

/* NEW */

//h
nh = colour_get_hue(argument1)

//s
ns = colour_get_saturation(argument1)

//v
nv = colour_get_value(argument1)

//interpolate
h = lerp(oh, nh, argument2)
s = lerp(os, ns, argument2)
v = lerp(ov, nv, argument2)

//return
return make_colour_hsv(h, s, v)



