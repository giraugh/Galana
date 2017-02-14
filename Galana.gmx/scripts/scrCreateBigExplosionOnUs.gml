///scrCreateBigExplosionOnUs()
var xx, yy;
xx = random_range(bbox_left, bbox_right)
yy = random_range(bbox_top, bbox_bottom)
instance_create(xx, yy, oBigExplosion)
scrEmitSmoke(xx, yy)
