///scrShotChargeCurve(x)

var xx = clamp(argument0, 0, 1)
return power(xx, 1.3 + ((1-xx)*2.2))
