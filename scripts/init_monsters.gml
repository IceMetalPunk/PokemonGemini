/// init_monsters()

var fn, contents = "", file, monster, monsterName;

fn = file_find_first("Data/Monsters/*.mdf", 0);

while (fn != "") {
    file = file_text_open_read("Data/Monsters/" + fn);
    contents = "";
    while (!file_text_eof(file)) {
        contents += file_text_read_string(file);
        file_text_readln(file);
    }
    file_text_close(file);
    
    monster = json_decode(contents);

    ds_list_add(global.monsterList, monster);
    ds_list_mark_as_map(global.monsterList, ds_list_size(global.monsterList) - 1);
    monsterName = filename_change_ext(fn, "");
    global.monsterMap[? monsterName] = ds_list_size(global.monsterList) - 1;
    
    fn = file_find_next();
}
file_find_close();
