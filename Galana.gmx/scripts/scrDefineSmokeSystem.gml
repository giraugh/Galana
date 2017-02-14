///scrDefineSmokeSystem()
var colour1 = make_colour_hsv(216, 37, 90)
var colour2 = make_colour_hsv(229, 82, 43)
var colour3 = make_colour_hsv(234, 81, 25)
var lifetime = 25
var flifetime = 15
var size = 1.3
var angleincrease = 2

//Declarations
globalvar smoke_system, smoke_part, smoke_part_fade;


///Create the smoke system
smoke_system = part_system_create()
part_system_depth(smoke_system, 1)



///Create the particle
smoke_part = part_type_create()
smoke_part_fade = part_type_create()


//static
part_type_sprite(smoke_part, sPartSmoke, false, false, true)
part_type_direction(smoke_part, 0, 360, 0, 0)
part_type_death(smoke_part, 1, smoke_part_fade)
part_type_size(smoke_part, size, size, 0, 0)

//dynamic
part_type_orientation(smoke_part, 0, 360, angleincrease, 0, true)
part_type_life(smoke_part, lifetime, lifetime)
part_type_colour3(smoke_part, colour1, colour1, colour1)

/* FADE PARTICLE */

//static
part_type_sprite(smoke_part_fade, sPartSmoke, false, false, true)
part_type_direction(smoke_part_fade, 0, 360, 0, 0)

//dynamic
part_type_orientation(smoke_part_fade, 0, 360, angleincrease, 0, true)
part_type_life(smoke_part_fade, flifetime, flifetime)
part_type_size(smoke_part_fade, size, size, -(size/flifetime), 0)
part_type_colour3(smoke_part_fade, colour1, colour2, colour3)



