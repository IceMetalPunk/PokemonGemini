/// load_regions([room])

var roomNo = room;
if (argument_count > 0) {
    roomNo = argument[0];
}

var roomName = room_get_name(roomNo);
var fileName = "Data/Regions/" + roomName + ".region";

if (!file_exists(fileName)) {
    show_debug_message("Couldn't find file: " + fileName);
    return false;
}

var file = file_text_open_read(fileName);

var jsonString = "";
while (!file_text_eof(file)) {
    jsonString += file_text_read_string(file);
    file_text_readln(file);
}
file_text_close(file);

global.regionMapCleanup = json_decode(jsonString);
global.regionMap = global.regionMapCleanup[? "default"];

return true;
