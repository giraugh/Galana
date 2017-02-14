///scrMakeIniNice(file)
//Makes an ini file human readable

//read it into contents
var f = file_text_open_read(argument0);
var contents = "";

while (!file_text_eof(f)) {
    contents += file_text_readln(f)
}

file_text_close(f)

//add extra lines
contents = string_replace_all(contents, "[", "
[")

//add whitespace near =
contents = string_replace_all(contents, "=", " = ")

//rewrite it
f = file_text_open_write(argument0)

file_text_write_string(f, contents)

file_text_close(f)
