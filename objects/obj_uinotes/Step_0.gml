if note > 3 {
	if keyboard_check(obj_persistent.bind[note-4]) {
		press = true
		alarm[0] = 1/(60/game_get_speed(gamespeed_fps))
	}
}