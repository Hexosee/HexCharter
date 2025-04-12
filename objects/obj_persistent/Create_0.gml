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

warningup = true
warningup = false
buttonlatch = false
invalidfiles = []

/*
if directory_exists(working_directory + "custom/") {
	file = file_find_first(working_directory + "custom/*", 0)

	while (file != "") {
		switch(asset_get_type(file)) {
			default: case asset_unknown:
				print(file,"invalid mod asset")
				array_push(invalidfiles, file)
			break
			case asset_sprite:
				sprite_replace(asset_get_index(file),1,0,false,false,0,0)
			break
		}
		folder = file_find_next()
	}

	file_find_close()
	
	if array_length(invalidfiles) > 0 {
		warningup = true
	}
}