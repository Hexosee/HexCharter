// might make this more mouse controlled another time idk

if keyboard_check_pressed(vk_up) or mouse_wheel_up()
	sel--
	
if keyboard_check_pressed(vk_down) or mouse_wheel_down()
	sel++
	
/*
if keyboard_check_pressed(vk_alt) {
	transition_goto(rm_playtesting)	
}
*/	

if keyboard_check_pressed(vk_f2) {
	transition_goto(rm_themeselector)
}
	

if keyboard_check_pressed(vk_enter) {
	if !instance_exists(obj_transition) {
		if sel != 0 {
			obj_persistent.thischart = charts[sel]
			audio_stop_sound(mus_arkaid)
			audio_play_sound(snd_josh,0,false)
			transition_goto(rm_charter)
		}
		else {
			audio_play_sound(snd_josh,0,false)
			transition_goto(rm_newchart)			
		}
	}
}

sel = clamp(sel,0,array_length(charts)-1)