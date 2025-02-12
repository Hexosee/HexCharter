if !selected {
	if keyboard_check_pressed(vk_up) or mouse_wheel_up()
		sel--
	
	if keyboard_check_pressed(vk_down) or mouse_wheel_down()
		sel++
		
	var l = array_length(opts)
	for (var i=0;i<l;i++) {
		ofs[i] = lerp(ofs[i],0,d(0.2))			
	}
		
	if keyboard_check_pressed(vk_enter) {
		audio_play_sound(snd_ha,0,false)
		if sel != 4 and sel != 5 and sel != 0 {
			selected = true
			switch(sel) {
				case 1:
					keyboard_string = songname
				break
				case 2:
					keyboard_string = bpm
				break
				case 3:
					keyboard_string = sspeed
				break
			}
		}
		else { // fancy stuff
			switch(sel) {
				case 0:
					transition_goto(rm_chartselect)
					obj_persistent.creating = false
				break
				case 4:
					var file = get_open_filename("ogg files|*.ogg","")
					if file != "" {
						songpath = file	
						fakepath = filename_name(file)
					}
				break
				case 5:
					if songpath == "" {
						alert_make("Invalid song path!")
						return
					}
					
					with(obj_persistent) {
						songname = other.songname
						bpm = real(other.bpm)
						sspeed = real(other.sspeed)
						songpath = other.songpath
					}
					
					transition_goto(rm_charter)
					audio_play_sound(snd_josh,0,false)
					audio_stop_sound(mus_arkaid)
					
				break
			}
		}
	}
}
else {
	ofs[sel] = lerp(ofs[sel],30,d(0.2))
	switch(sel) {
		case 1:
			songname = keyboard_string
		break
		case 2:
			bpm = keyboard_string
		break
		case 3:
			sspeed = keyboard_string
		break
	}
	if keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_enter) {
		audio_play_sound(snd_dwuh,0,false)
		selected = false
		keyboard_string = ""
	}
}
	
opts[1] = $"Song Name: {songname}"
opts[2] = $"BPM: {bpm}"
opts[3] = $"Scroll Speed: {sspeed}"
opts[4] = $"Song .ogg File: {fakepath}"
	
	
sel = clamp(sel,0,array_length(opts)-1)