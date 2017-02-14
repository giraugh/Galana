///scrEmitSmoke(x, y)
var range = 35
var count = 30
var xx = argument0
var yy = argument1

///Create the emitter 
smoke_emitter = part_emitter_create(smoke_system)
part_emitter_region(smoke_system, smoke_emitter, xx - range, xx + range, yy - range, yy + range, ps_shape_ellipse, ps_distr_gaussian)
part_emitter_burst(smoke_system, smoke_emitter, smoke_part, count)


///Destroy it now that we're done
part_emitter_destroy(smoke_system, smoke_emitter)
