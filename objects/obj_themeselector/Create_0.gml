themes = load_theme_list()

array_insert(themes, 0, ["Back",""])
array_insert(themes, 1, ["",""])

print(obj_persistent.config.charter.curtheme)
for(var i = 0; i < array_length(themes); i++) {
	if themes[i][1] == obj_persistent.config.charter.curtheme {
		themes[i][0] = "> " + themes[i][0]
		break
	}
}

curr_theme = noone

targ_back_col = obj_persistent.col_overlay
targ_fore_col = obj_persistent.col_grid2

curr_back_col = targ_back_col
curr_fore_col = targ_fore_col

curr_alpha_lerp = 1

sel = 0
lastsel = -1

prevsize = [500,500]
curr_prevsprite = noone
last_prevsprite = noone

function make_color_from_array(array){
	return make_color_rgb(array[0],array[1],array[2])
}

function draw_preview(theme) {
	// bg and top bar
	draw_clear_alpha(make_color_from_array(theme.col_bg), 1) // im smart.
	draw_set_color(make_color_from_array(theme.col_overlay))
	draw_rectangle(0,0,500,30,false)
	
	// draw words
	draw_set_color(c_white)
	draw_set_font(fnt_big)
	draw_set_halign(fa_left)

	var wid = 0
	var pad = 0
	var wold = 0
	var pold = 0
	var keys = ["File","Help","Edit","Tools"]
	for (var i = 0; i<array_length(keys); i++) {
		wold = wid; pold = pad
		draw_text(8+wold+pold,-4,keys[i])
		wid+= string_width(keys[i])
		pad+=16
	}
	
	draw_set_font(fnt_main)
	
	var notestartx = 72
	var notey = 96*2
	
	var boxsize = 48
	
	for(var col = 0; col <= 8; col++) {
		var notex = notestartx
		for(var row = 0; row < 8; row++) {
			draw_set_color(((row+col) % 2 == 0) ? make_color_from_array(curr_theme.col_grid1) : make_color_from_array(curr_theme.col_grid2))
			draw_rectangle(notex, notey, notex+boxsize, notey+boxsize, false)
			
			if col == 0 {
				if row == 7 draw_sprite_ext(spr_special, 4, notex,notey,1.5,1.5,0,c_white,1)
				draw_sprite_ext(spr_receptorsNEW, row%4, notex, notey, 1.5,1.5,0,c_white,0.7)	
			}
			
			if col-row==2 {
				draw_sprite_ext(spr_notes, row%4, notex, notey, 1.5,1.5,0,c_white,1)
			}
			
			notex += boxsize
			if row == 3 notex += 10*(boxsize/16)
		}
		notey += boxsize
	}
}