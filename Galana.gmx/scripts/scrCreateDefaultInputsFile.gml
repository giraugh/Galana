///scrCreateDefaultInputsFile()
ini_open("inputs.ini")

/* PLAYER */

ini_write_string("player_left", "0", 'LET: A')
ini_write_string("player_left", "1", 'VKE: left')

ini_write_string("player_right", "0", 'LET: D')
ini_write_string("player_right", "1", 'VKE: right')

ini_write_string("player_shoot", "0", 'VKE: space')
ini_write_string("player_shoot", "1", 'VKE: enter')
ini_write_string("player_shoot", "2", 'VKE: shift')
ini_write_string("player_shoot", "3", 'MOS: left')

/* MENU */

//menu navigation
ini_write_string("menu_right", "0", 'LET: D')
ini_write_string("menu_right", "1", 'VKE: right')

ini_write_string("menu_left", "0", 'LET: A')
ini_write_string("menu_left", "1", 'VKE: left')

ini_write_string("menu_up", "0", 'LET: W')
ini_write_string("menu_up", "1", 'VKE: up')

ini_write_string("menu_down", "0", 'LET: S')
ini_write_string("menu_down", "1", 'VKE: down')

//choose option in menu
ini_write_string("menu_select", "0", 'VKE: space')
ini_write_string("menu_select", "1", 'VKE: enter')

//pause menu (bcksp is for android)
ini_write_string("menu_pause", "0", 'VKE: escape')
ini_write_string("menu_pause", "1", 'VKE: tab')
ini_write_string("menu_pause", "2", 'VKE: backspace')

//continue after death
ini_write_string("menu_continue", "0", 'VKE: space')
ini_write_string("menu_continue", "1", 'VKE: enter')
ini_write_string("menu_continue", "2", 'MOS: left')

ini_close()
