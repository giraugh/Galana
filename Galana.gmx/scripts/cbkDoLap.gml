///cbkDoLap()

global.wave_delay -= .5 * room_speed
global.wave_delay = max(2 * room_speed, global.wave_delay)
