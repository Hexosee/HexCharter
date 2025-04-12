// might make this more mouse controlled another time idk

if !autosave_menu {

	if keyboard_check_pressed(vk_up) or mouse_wheel_up() {
		sel--
		while string_starts_with(charts[sel], "---") {
			sel--	
		}
	}
	
	if keyboard_check_pressed(vk_down) or mouse_wheel_down() {
		sel++
		while string_starts_with(charts[sel], "---") {
			sel++	
		}
	}
		
	if keyboard_check_pressed(vk_enter) {
		if !instance_exists(obj_transition) {
			if sel != 0 and sel != 1 {
				obj_persistent.thischart = charts[sel]
				if !folder_is_empty($"charts/{charts[sel]}/autosaves/") {
					transition_goto(rm_charter)
					audio_stop_sound(mus_arkaid)
					audio_play_sound(snd_josh,0,false)
				}
				else {
					alerp=-25
					autosave_menu = true
					saves = folder_get_files($"charts/{charts[sel]}/autosaves/*.swows")
					print(saves)
					array_insert(saves,0,"i dont care load anyways")
					print(saves)
					audio_play_sound(snd_ha,0,false)
				}
			}
			else {
				audio_play_sound(snd_josh,0,false)
				if sel == 0
					transition_goto(rm_newchart)	
				if sel == 1
					transition_goto(rm_themeselector)
			}
		}
	}
}
else {
	if keyboard_check_pressed(vk_up) or mouse_wheel_up()
		autosel--
	
	if keyboard_check_pressed(vk_down) or mouse_wheel_down()
		autosel++	
		
	if keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_shift) or keyboard_check_pressed(ord("X"))
		autosave_menu = false
		
	if keyboard_check_pressed(vk_enter) {
		if autosel == 0 {
			obj_persistent.thischart = charts[sel]
			transition_goto(rm_charter)
			audio_stop_sound(mus_arkaid)
			audio_play_sound(snd_josh,0,false)
		}
		else {
			obj_persistent.thischart = charts[sel]
			obj_persistent.thissave = saves[autosel]
			obj_persistent.is_autosave = true
			audio_stop_sound(mus_arkaid)
			transition_goto(rm_charter)
		}
	}
}

if keyboard_check_pressed(vk_f12) { 
	if sel != 0 {
		obj_persistent.playtest_chart = charts[sel]
		transition_goto(rm_playtesting)	
	}
}

sel = clamp(sel,0,array_length(charts)-1)
autosel = clamp(autosel,0,array_length(saves)-1)