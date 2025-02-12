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
	if (mouse_wheel_down() or keyboard_check_pressed(vk_down)) and not ((mx > 5 and mx < 320+5) and (mouse_y > 675 and mouse_y < 715))
		y-=s
	
	if (mouse_wheel_up() or keyboard_check_pressed(vk_up)) and not ((mx > 5 and mx < 320+5) and (mouse_y > 675 and mouse_y < 715))
		y+=s
}
else
	if (mouse_wheel_down() or keyboard_check_pressed(vk_down) or mouse_wheel_up() or keyboard_check_pressed(vk_up)) and not ((mx > 5 and mx < 320+5) and (mouse_y > 675 and mouse_y < 715)) { audio_pause_sound(songplaying); paused = true }

if paused
	audio_sound_set_track_position(songplaying,-((y*60) / bpm / 4) / 32)
else
	y = -((audio_sound_get_track_position(songplaying) / 60) * bpm * 4) * 32
	
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
y=-clamp(-y,0,infinity)


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
	
	if (mouse_wheel_down() or keyboard_check_pressed(vk_down))
		customtype -= 1
		
	if (mouse_wheel_up() or keyboard_check_pressed(vk_up))
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