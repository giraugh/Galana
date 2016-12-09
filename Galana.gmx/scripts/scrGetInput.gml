///scrGetInput(input, ?type)
var in = argument0 //input: 'type:val'
var ct = argument1 //checktype: either "default", "pressed" or "released"



//input type
var type = string_char_at(in, 1) + string_char_at(in, 2) + string_char_at(in, 3)

//input value
var val = string_delete(in, 1, 5)

//remove newlines (in a roundabout way)
val = string_replace_all(val, "
", "")

switch (type) {
    case "LET" :
        //Letter (ord)
        val = string_upper(val)
        if (ct == "default")
            return keyboard_check(ord(val))
        
        if (ct == "pressed")
            return keyboard_check_pressed(ord(val))
            
        if (ct == "released")
            return keyboard_check_released(ord(val))
    break
    
    case "VKE":
        //Virtual key (vk_)
        val = string_lower(val)
        switch (val) {
            case "nokey": val = vk_nokey break
            case "anykey": val = vk_anykey break
            case "left": val = vk_left break
            case "right": val = vk_right break
            case "up": val = vk_up break
            case "down": val = vk_down break
            case "l": val = vk_left break
            case "r": val = vk_right break
            case "u": val = vk_up break
            case "d": val = vk_down break
            case "enter": val = vk_enter break
            case "escape": val = vk_escape break
            case "esc": val = vk_escape break
            case "space": val = vk_space break
            case "shift": val = vk_shift break
            case "control": val = vk_control break
            case "alt": val = vk_alt break
            case "backspace": val = vk_backspace break
            case "return": val = vk_backspace break
            case "tab": val = vk_tab break
            case "home": val = vk_home break
            case "end": val = vk_end break
            case "delete": val = vk_delete break
            case "del": val = vk_delete break
            case "insert": val = vk_insert break
            case "ins": val = vk_insert break
            case "pageup": val = vk_pageup break
            case "pagedown": val = vk_pagedown break
            case "pause": val = vk_pause break
            case "printscreen": val = vk_printscreen break
            case "prntscrn": val = vk_printscreen break
            case "multiply": val = vk_multiply break
            case "divide": val = vk_divide break
            case "add": val = vk_add break
            case "subtract": val = vk_subtract break
            case "decimal": val = vk_decimal break
            case "*": val = vk_multiply break
            case "/": val = vk_divide break
            case "+": val = vk_add break
            case "-": val = vk_subtract break
            case ".": val = vk_decimal break
            case "f1": val = vk_f1 break
            case "f2": val = vk_f2 break
            case "f3": val = vk_f3 break
            case "f4": val = vk_f4 break
            case "f5": val = vk_f5 break
            case "f6": val = vk_f6 break
            case "f7": val = vk_f7 break
            case "f8": val = vk_f8 break
            case "f9": val = vk_f9 break
            case "f10": val = vk_f10 break
            case "f11": val = vk_f11 break
            case "f12": val = vk_f12 break
            case "numpad0": val = vk_numpad0 break
            case "numpad1": val = vk_numpad1 break
            case "numpad2": val = vk_numpad2 break
            case "numpad3": val = vk_numpad3 break
            case "numpad4": val = vk_numpad4 break
            case "numpad5": val = vk_numpad5 break
            case "numpad6": val = vk_numpad6 break
            case "numpad7": val = vk_numpad7 break
            case "numpad8": val = vk_numpad8 break
            case "numpad9": val = vk_numpad9 break
            case "num0": val = vk_numpad0 break
            case "num1": val = vk_numpad1 break
            case "num2": val = vk_numpad2 break
            case "num3": val = vk_numpad3 break
            case "num4": val = vk_numpad4 break
            case "num5": val = vk_numpad5 break
            case "num6": val = vk_numpad6 break
            case "num7": val = vk_numpad7 break
            case "num8": val = vk_numpad8 break
            case "num9": val = vk_numpad9 break
        }
        
        if (ct == "default")
            return keyboard_check(val)
        
        if (ct == "pressed")
            return keyboard_check_pressed(val)
            
        if (ct == "released")
            return keyboard_check_released(val)
        
    break
    
    case "MOS":
        //Mouse (lmb|rmb|mmb)
        val = string_lower(val)
        switch (val) {
            case "lmb": val = mb_left break
            case "left": val = mb_left break
            
            case "rmb": val = mb_right break
            case "right": val = mb_right break
            
            case "mmb": val = mb_middle break
            case "middle": val = mb_middle break
        }
        
        if (ct == "default")
            return mouse_check_button(val)
        
        if (ct == "pressed")
            return mouse_check_button_pressed(val)
            
        if (ct == "released")
            return mouse_check_button_released(val)
        
    break
}

return false
