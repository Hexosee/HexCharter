if note > 3 {
	if keyboard_check(obj_persistent.bind[note-4]) {
		press = true
		alarm[0] = 1/(60/game_get_speed(gamespeed_fps))
	}
	
	// not sure why this doesnt work?
	
    /*if keyboard_check_pressed(obj_persistent.bind[note-4]) and !place_meeting(x,y,obj_note) {
        obj_playtest.misses+=1
        obj_playtest.coolscore-=50
	    audio_play_sound(snd_owch,9999,false,1,0,0.6 + random(0.8))
    }*/
}