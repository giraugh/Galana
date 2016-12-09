///scrLoadInputsFile()

/*
    --- HOW THIS WORKS BECAUSE I WILL FORGET ---
    
all inputs are stored in a map.
the data is loaded without the ini library.
we go through each line of the inputs file and check if its
a section (they have a [ at the start) if so then we set a flag
to that section name (cool string formatting, check!)
if its not a section then we map the key with the value of the
section flag to the value and also increase a flag which stores how many
keys we found for that section.

Keys in map:       [?section:key] -> (string) "input_type:input_val"
Num Keys in map:   [?#section] -> (real) num of inputs (starts from zero)

*/


var section = "",
    key,
    val,
    keynum = 0

//create inputs data structure
global.Inputs = ds_map_create()

//parse it as text to find all section names
f = file_text_open_read("inputs.ini")

//for each line of inputs file
while (!file_text_eof(f)) {
    //read line
    line = file_text_readln(f)
    
    //section or key-val?
    if (string_char_at(line, 1) == "[") {
        //store the amount of keys we got for the previous section
        if (section != "") {
            global.Inputs[?"#"+section] = keynum
            
            //reset number of keys
            keynum = 0
        }
    
        //new section
        section = string_delete(string_delete(line, string_length(line)-2, 3), 1, 1)
        show_debug_message("Loading: " + section)
    } else {
        //key-val
        key = string_char_at(line, 1)
        val = string_delete(line, 1, 3)
        val = string_replace_all(val, '"', '')
        
        //store it dude
        global.Inputs[?section+":"+key] = val
        
        //increase section keynum
        keynum++
    }
}

//store the amount of keys we got for the last section
if (section != "") {
    global.Inputs[?"#"+section] = keynum
    
    //reset number of keys
    keynum = 0
}
