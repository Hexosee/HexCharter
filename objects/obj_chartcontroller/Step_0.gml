var s
if keyboard_check(vk_shift)
	s = mscroll*2	
else
	s = mscroll	
	
if keyboard_check_pressed(vk_space) {
	if paused {
		audio_resume_sound(songplaying)	
		paused = false
	}
	else {
		audio_pause_sound(songplaying)	
		paused = true
	}
}

var mx = floor(mouse_x/35)
if paused {
	if (is_scrolling_down() or keyboard_check_pressed(vk_down)) and not ((mx > 5 and mx < 325) and (mouse_y > 675 and mouse_y < 715))
		y-=s
	
	if (is_scrolling_up() or keyboard_check_pressed(vk_up)) and not ((mx > 5 and mx < 325) and (mouse_y > 675 and mouse_y < 715))
		y+=s
		
	if keyboard_check_pressed(ord("D")) 
		y = (floor((y-1)/(s*16))) * (s*16)
		
	if keyboard_check_pressed(ord("A")) 
		y = (ceil((y+1)/(s*16))) * (s*16)
}
else
	if (is_scrolling_down() or keyboard_check_pressed(vk_down) or is_scrolling_up() or keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("D"))) and not ((mx > 5 and mx < 320+5) and (mouse_y > 675 and mouse_y < 715)) { audio_pause_sound(songplaying); paused = true; last_hovered_step = -1 }

// zooming
if mouse_wheel_down() and keyboard_check(vk_control) 
	zoom-=0.1


if mouse_wheel_up() and keyboard_check(vk_control) 
	zoom+=0.1

zoom = clamp(zoom,1,2)
zlerp = lerp(zlerp,zoom,0.02)

var camw = camera_get_view_width(view_camera[0])
var camh = camera_get_view_height(view_camera[0])

camera_set_view_size(view_camera[0],1280/zlerp,720/zlerp)
camera_set_view_pos(view_camera[0],1280/2-camw/2,-zlerp) // might be srtupid whoops

if paused
	audio_sound_set_track_position(songplaying,-((y*60) / bpm / 4) / 32)
else {
	y = -((audio_sound_get_track_position(songplaying) / 60) * bpm * 4) * 32
	
	if floor(y/s) != last_hovered_step {
		var steppos = (floor(y/s)+1)
		print(steppos)
		// metronome
		// TODO: customizable sounds? maybe do this when palettes are implemented
		if play_metronome {
			if steppos % 16 == 0 {
				print("section hit")
				audio_play_sound(snd_metroup_default, 9999, 0)
			} else if steppos % 4 == 0 {
				audio_play_sound(snd_metrodown_default, 9999, 0)
				print("beat hit")
			}
		}
			 
		// hitsounds
		if play_hitsounds {
			for (var bb = 0; bb < keys*2; bb++) {
				if notes[bb,abs(steppos)] != 0 and not array_contains(hitsound_id_blacklist, notes[bb, abs(steppos)]) {
					print("dats a note")
					audio_play_sound(snd_hitsound_default, 9999, 0)
				}
			}
		}
		last_hovered_step = floor(y/s)
	}
}

var num	
for (num = 0; num <= 9; num++)
{
    if (keyboard_check_pressed(ord(num))) {
        audio_sound_set_track_position(songplaying, num * 0.1 * audio_sound_length(songplaying))
		if !paused
			y = -((audio_sound_get_track_position(songplaying) / 60) * bpm * 4) * 32
		else
			y = -(num * 0.1 * (audio_sound_length(songplaying)/60)*bpm * 4  * 32)
	}
}
// point and laugh
//y=-clamp(-y,0,infinity)

y=min(y,0)

curb = floor(((mouse_y-y))/32)-3

// this feels really dumb to do but it works so i'm not complaining

curbb = ((mouse_x)/32)-center/32
if curbb >= keys
	curbb-=0.32
curbb=floor(curbb)

// charting COMMENCE

if !(curbb < 0 or curbb >= keys*2) and !(curb < 0 or curb > songlong) {
	if mouse_check_button_pressed(mb_left) {
		if curtype == -1 
			notes[curbb,curb] = customtype
		else
			notes[curbb,curb] = curtype
	}
	
	if mouse_check_button_pressed(mb_middle) {
		if curtype == 2
			notes[curbb,curb] = 9
		else
			notes[curbb,curb] = 8
	}
	
	if mouse_check_button(mb_right)
		notes[curbb,curb] = 0
}

// notetype select
var mx = mouse_x
var my = mouse_y
if (mx > 5 and mx < 320+5) and (my > 675 and my < 715) {
	
	if (is_scrolling_down() or keyboard_check_pressed(vk_down))
		customtype -= 1
		
	if (is_scrolling_up() or keyboard_check_pressed(vk_up))
		customtype += 1	
		
	customtype = clamp(customtype,11,infinity)
	
	notelist[8][2] = $"Custom Note ({customtype})"

	if mouse_check_button_pressed(mb_left) {
		var mx = floor(mouse_x/35)
		switch(mx+1) {
			default:
				curtype = mx+1
			break
			case 8:
				curtype = 10
			break
			case 9:
				curtype = -1
			break
		}
	}
}