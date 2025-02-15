if keyboard_check_pressed(vk_up) or mouse_wheel_up()
	change_sel(-1)
	
if keyboard_check_pressed(vk_down) or mouse_wheel_down()
	change_sel(1)
	
if keyboard_check_pressed(vk_enter) {
	if !instance_exists(obj_transition) {
		if sel != 0 {
			audio_play_sound(snd_josh, 0, false)
			obj_persistent.set_theme(themes[sel][1])
		}
		else {
			audio_play_sound(snd_ha,0,false)
			transition_goto(rm_chartselect)			
		}
	}
}

if keyboard_check_pressed(vk_escape) {
	audio_play_sound(snd_ha,0,false)
	transition_goto(rm_chartselect)
}

function change_sel(amt) {
	var last_sel = sel
	sel += amt
	sel = clamp(sel,0,array_length(themes)-1)
	if last_sel == sel
		return
	
	if themes[sel][0] == "" or themes[sel][0] == "Back" {
		get_theme_vars(obj_persistent.config.charter.curtheme)
		if themes[sel][0] == ""
			change_sel(sign(amt))
	} else {
		get_theme_vars(themes[sel][1])
	}
}

function get_theme_vars(theme) {
	self.curr_theme = parse_theme(theme)

	self.curr_fore_col = targ_fore_col
	self.curr_back_col = targ_back_col
	
	self.targ_back_col = make_color_rgb(curr_theme.col_overlay[0], curr_theme.col_overlay[1], curr_theme.col_overlay[2])
	self.targ_fore_col = make_color_rgb(curr_theme.col_grid2[0], curr_theme.col_grid2[1], curr_theme.col_grid2[2])
	
	self.curr_alpha_lerp = 0
}