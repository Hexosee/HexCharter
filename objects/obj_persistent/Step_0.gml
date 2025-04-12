delta_step()

if warningup {
	var ww = window_get_width()
	var wh = window_get_height()
	if MOUSE_X >= ww/2-200 and MOUSE_X <= ww/2+200 and MOUSE_Y >= wh*.9-100 and MOUSE_Y <= wh*.9-20 {
		if mouse_check_button_pressed(mb_left) buttonlatch = true
		if mouse_check_button_released(mb_left) and buttonlatch {
			buttonlatch = false
			warningup = false
			audio_play_sound(snd_ha, 999999, false)
		}
	}
}

/*if keyboard_check_pressed(vk_f1) {
	config.charter.curtheme = get_string("give theme",config.charter.curtheme)
	theme_load(config.charter.curtheme)
}