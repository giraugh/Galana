///scrGetAxis(act_name)
var act_name = argument[0]

//Amount of axis for the action
var axisNum = global.Inputs[?"#" + act_name]

//Total positive and negative axis output
var opos = 0, 
    oneg = 0

//for each axis
for (var i = 0; i < axisNum; i++) {
    var axis = global.Inputs[?act_name + ":" + string(i)]
    
    //is it a gamepad axis?
    if (string_char_at(axis, 1) == "!") {
        axis = string_delete(axis, 1, 1)
        which = real(string_char_at(axis, 1))
        axis = string_delete(axis, 1, 1)
        axis = string_letters(axis)
        
        if (axis == "lh") {
            opos += gamepad_axis_value(which, gp_axislh)
            continue
        }
        
        if (axis == "lv") {
            opos += gamepad_axis_value(which, gp_axislv)
            continue
        }
        
        if (axis == "rh") {
            opos += gamepad_axis_value(which, gp_axisrh)
            continue
        }
        
        if (axis == "rv") {
            opos += gamepad_axis_value(which, gp_axisrv)
            continue
        }
    }
    
    //two inputs that define axis
    var i1="", i2="", 
        cur = 0 //keep track of current input being read
    
    //for each character of axis
    for (var c = 1; c < string_length(axis); c++) {
        var ch = string_char_at(axis, c)
        //switch to other input?
        if (ch == "|") {
            cur = 1
            continue
        }
        
        //add onto current input
        if (cur == 0) {
            i1 += ch
        } else {
            i2 += ch
        }
    }
    
    //remove newlines
    i1 = string(string_replace_all(i1, "
    ", ""))
    i2 = string(string_replace_all(i2, "
    ", ""))
    
    
    //add inputs on to global outcome
    oneg += scrGetInput(i1, "default")
    opos += scrGetInput(i2, "default")
}

return opos - oneg
