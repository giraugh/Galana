var padding = 100;

// Much slower
y += 1
            
//if we are too far from the centre then bring us back towards the centre
if (x < padding)              x += .5
if (x > room_width - padding) x -= .5
