///scrCreateDefaultInputsFile()
ini_open("inputs.ini")

/* PLAYER */

ini_write_string("player_h", "0", 'LET: A|LET: D')
ini_write_string("player_h", "1", 'VKE: left|VKE: right')
ini_write_string("player_h", "2", 'GMP: 0: padl|GMP: 0: padr')
ini_write_string("player_h", "3", '!0lh')


ini_write_string("player_shoot", "0", 'VKE: space')
ini_write_string("player_shoot", "1", 'VKE: enter')
ini_write_string("player_shoot", "2", 'VKE: shift')
ini_write_string("player_shoot", "3", 'MOS: left')
ini_write_string("player_shoot", "4", 'GMP: 0: A')
ini_write_string("player_shoot", "5", 'GMP: 0: RB')
ini_write_string("player_shoot", "6", 'GMP: 0: RT')
ini_write_string("player_shoot", "7", 'VKE: up')

/* MENU */

//menu navigation
ini_write_string("menu_right", "0", 'LET: D')
ini_write_string("menu_right", "1", 'VKE: right')
ini_write_string("menu_right", "2", 'GMP: 0: padr')

ini_write_string("menu_left", "0", 'LET: A')
ini_write_string("menu_left", "1", 'VKE: left')
ini_write_string("menu_left", "2", 'GMP: 0: padl')

ini_write_string("menu_up", "0", 'LET: W')
ini_write_string("menu_up", "1", 'VKE: up')
ini_write_string("menu_up", "2", 'GMP: 0: padu')

ini_write_string("menu_down", "0", 'LET: S')
ini_write_string("menu_down", "1", 'VKE: down')
ini_write_string("menu_down", "2", 'GMP: 0: padd')

//choose option in menu
ini_write_string("menu_select", "0", 'VKE: space')
ini_write_string("menu_select", "1", 'VKE: enter')
ini_write_string("menu_select", "2", 'GMP: 0: A')

//pause menu (bcksp is for android)
ini_write_string("menu_pause", "0", 'VKE: escape')
ini_write_string("menu_pause", "1", 'VKE: tab')
ini_write_string("menu_pause", "2", 'VKE: backspace')
ini_write_string("menu_pause", "3", 'GMP: 0: start')
ini_write_string("menu_pause", "3", 'LET: M')

//continue after death
ini_write_string("menu_continue", "0", 'VKE: space')
ini_write_string("menu_continue", "1", 'VKE: enter')
ini_write_string("menu_continue", "2", 'MOS: left')
ini_write_string("menu_continue", "3", 'GMP: 0: A')
ini_write_string("menu_continue", "4", 'GMP: 0: start')

ini_close()
