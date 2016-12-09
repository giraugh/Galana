///scrGetAction(action_name, check_type)
var act_name = argument[0]

//optional check type
if (argument_count > 1) {
    var ct = argument[1] //checktype: either "default", "pressed" or "released"
} else {
    ct = "default"
}

//amount of inputs for that action
var inputNum = global.Inputs[?"#" + act_name]

//for each one
for (var i = 0; i < inputNum; i++) {
    var input = global.Inputs[?act_name + ":" + string(i)]
    if (scrGetInput(input, ct) == true) {
        return true
    }
}

//no input down
return false

