if keyboard_check_pressed(vk_up) or mouse_wheel_up()
	change_sel(-1)
	
if keyboard_check_pressed(vk_down) or mouse_wheel_down()
	change_sel(1)
	
if keyboard_check_pressed(vk_enter) {
	if !instance_exists(obj_transition) {
		if sel != 0 {
			audio_play_sound(snd_josh, 0, false)
			obj_persistent.set_theme(themes[sel][1])
			
			// this is bad
			themes = load_theme_list()
			array_insert(themes, 0, ["Back",""])
			array_insert(themes, 1, ["",""])
			
			themes[sel][0] = "> " + themes[sel][0]
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
		lastsel = last_sel // genius
		
		var draw_lastprev = themes[lastsel][0] != "Back" and themes[lastsel][0] != ""
		if draw_lastprev {
			var last_prevsurf = surface_create(prevsize[0],prevsize[1])
			
			surface_set_target(last_prevsurf)
				draw_preview(curr_theme)
			surface_reset_target()
			
			last_prevsprite = sprite_create_from_surface(last_prevsurf, 0, 0, prevsize[0],prevsize[1],false,false,prevsize[0],prevsize[1]/2)
			surface_free(last_prevsurf)
		}
		
		get_theme_vars(themes[sel][1])
		var curr_prevsurf = surface_create(prevsize[0],prevsize[1])
		
		surface_set_target(curr_prevsurf)
			draw_preview(curr_theme)
		surface_reset_target() 
		
		curr_prevsprite = sprite_create_from_surface(curr_prevsurf, 0, 0, prevsize[0],prevsize[1],false,false,prevsize[0],prevsize[1]/2)
		surface_free(curr_prevsurf)
	}
}

function get_theme_vars(theme) {
	self.curr_theme = parse_theme(theme)

	self.curr_fore_col = merge_color(curr_fore_col, targ_fore_col, curr_alpha_lerp)
	self.curr_back_col = merge_color(curr_back_col, targ_back_col, curr_alpha_lerp)
	
	self.targ_back_col = make_color_from_array(curr_theme.col_overlay)
	self.targ_fore_col = make_color_from_array(curr_theme.col_grid2)
	
	self.curr_alpha_lerp = 0
}