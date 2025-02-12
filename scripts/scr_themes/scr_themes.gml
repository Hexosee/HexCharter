function theme_load(themeto) {
	var file = file_text_open_read($"themes/{themeto}.json")
	var json = "" 
	
	while (!file_text_eof(file)) {
		
		var line = file_text_read_string(file);
		
		if (string_pos("//", line) == 0) {
			json += line;
		}
		
		file_text_readln(file);
		
	}
	
	file_text_close(file);
	var theme = json_parse(json)	
	
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
}