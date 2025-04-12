function read_json(file)  {
	var json = ""
	while (!file_text_eof(file)) {
		
		var line = file_text_read_string(file);
	
		if (string_pos("//", line) == 0) {
			json += line;
		}
	
		file_text_readln(file);
		
	}
	
	file_text_close(file);
	
	return json
}

function parse_theme(themeto) {
	var file = file_text_open_read($"{working_directory}themes/{themeto}.json")
	var json = read_json(file)
	
	var theme = json_parse(json)
	return theme
}

function theme_load(themeto) {
	if file_exists($"{working_directory}themes/{themeto}.json") {
		theme = parse_theme(themeto)
	
		col_bg = make_color_rgb(theme.col_bg[0],theme.col_bg[1],theme.col_bg[2])
		col_overlay = make_color_rgb(theme.col_overlay[0],theme.col_overlay[1],theme.col_overlay[2])

		// light
		col_grid1 = make_color_rgb(theme.col_grid1[0],theme.col_grid1[1],theme.col_grid1[2])
		col_grid1_offbeat = make_color_rgb(theme.col_grid1_offbeat[0],theme.col_grid1_offbeat[1],theme.col_grid1_offbeat[2])
		// offsection
		col_grid1_b = make_color_rgb(theme.col_grid1_b[0],theme.col_grid1_b[1],theme.col_grid1_b[2])
		col_grid1_offbeat_b = make_color_rgb(theme.col_grid1_offbeat_b[0],theme.col_grid1_offbeat_b[1],theme.col_grid1_offbeat_b[2])
	
		// dark
		col_grid2 = make_color_rgb(theme.col_grid2[0],theme.col_grid2[1],theme.col_grid2[2])
		col_grid2_offbeat = make_color_rgb(theme.col_grid2_offbeat[0],theme.col_grid2_offbeat[1],theme.col_grid2_offbeat[2])
		// offsection
		col_grid2_b = make_color_rgb(theme.col_grid2_b[0],theme.col_grid2_b[1],theme.col_grid2_b[2])
		col_grid2_offbeat_b = make_color_rgb(theme.col_grid2_offbeat_b[0],theme.col_grid2_offbeat_b[1],theme.col_grid2_offbeat_b[2])	
	
		author = theme.author
	}
}

function load_theme_list() {
	var themes = []
	var theme_dir = $"{working_directory}themes/"
	
	// genuinely no reason the themes folder shouldnt exist so dont check for it
	// if it doesnt its entirely user error and not our fault
	var theme = file_find_first(theme_dir + "*.json", fa_none)
	
	while theme != "" {
		var pair = []
		// idk if this is a good idea for every theme lol could cause some lag l8r
		var file = file_text_open_read(theme_dir + theme)
		var parsed = json_parse(read_json(file))
		file_text_close(file)
		
		array_push(pair, string_lower(parsed.name))
		theme = string_replace_all(theme, ".json", "")
		array_push(pair, theme)
		
		array_push(themes, pair)
		
		theme = file_find_next()
	}
	
	return themes
}