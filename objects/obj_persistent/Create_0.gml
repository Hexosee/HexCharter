// theming
col_bg = make_color_rgb(30, 30, 46)
col_overlay = make_color_rgb(17, 17, 27)

// light
col_grid1 = make_color_rgb(69, 71, 90)
col_grid1_offbeat = make_color_rgb(81, 77, 99)
// offsection
col_grid1_b = make_color_rgb(86, 88, 114)
col_grid1_offbeat_b = make_color_rgb(99, 95, 122)

// dark
col_grid2 = make_color_rgb(49, 50, 68)
col_grid2_offbeat = make_color_rgb(63, 58, 86)
// offsection
col_grid2_b = make_color_rgb(70, 73, 107)
col_grid2_offbeat_b = make_color_rgb(78, 71, 112)

thischart = ""
thissave = ""
creating = false
is_autosave = false

playtest_chart = "tutorial"

config = {
	ver:"1.0",
	charter: {
		curtheme: "catpuccin-mocha",
	}
	
}

config_ORIG = config

config_load()
theme_load(config.charter.curtheme)


// playtesting
downscroll = false
bind = [ord("D"),ord("F"),ord("J"),ord("K")]

delta_init()

function set_theme(theme) {
	config.charter.curtheme = theme
	theme_load(theme)
}

// untested and probably doesnt work yet
// i'll do this tomorrow! (I PROMISE!)
warningup = false
buttonlatch = false
invalidfiles = []

if directory_exists(working_directory + "custom/") {
	
	if !file_exists(working_directory + "custom/README.txt") {
		var file = file_text_open_write(working_directory + "custom/README.txt")
		
			file_text_write_string(file,"any file in this folder that matches a sprite name will replace it!\nthe xorig and yorig values are the origin points of each image\nmost of the time these should match what you put in the json! (unless you're doing custom preview characters)\n")
			file_text_writeln(file)
		
			for (var f = 0; f < 100000; f++) {
				var fname = sprite_get_name(f)
				if (string_char_at(fname, 1) == "<") break
				file_text_write_string(file,$"{fname} | xorig: {sprite_get_xoffset(f)} // yorig: {sprite_get_yoffset(f)}")
				file_text_writeln(file)
			}
		file_text_close(file)
	}
	
	var file = file_find_first(working_directory + "custom/*", 0)

	while (file != "") {
		if file != "README.txt" and filename_ext(file) != ".json" {
			var noext = filename_change_ext(file,"")
			if !file_exists(working_directory + $"custom/{noext}.json") {
				array_push(invalidfiles, "custom/"+file+" (has no json!)")
			} 
			else {
				try {
					var meta = json_parse(read_json(file_text_open_read(working_directory + $"custom/{noext}.json")))
					switch(asset_get_type(noext)) {
						default: case asset_unknown:
							print(file,"invalid mod asset")
							array_push(invalidfiles, "custom/"+file)
						break
						case asset_sprite:
							sprite_replace(asset_get_index(noext),working_directory + $"custom/{file}",meta.frames,false,false,meta.xorig,meta.yorig)
						break
					}
				}
				catch(ex) {
					print(file,"RED ALERT RED ALERT")
					array_push(invalidfiles, "custom/"+file+$" {ex.message}")					
				}
			}
		}
		file = file_find_next()
	}

	file_find_close()
	
	if array_length(invalidfiles) > 0 {
		warningup = true
	}
}