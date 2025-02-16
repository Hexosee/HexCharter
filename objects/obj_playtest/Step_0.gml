songpos=audio_sound_get_track_position(songplaying)
if instance_exists(obj_uinotes) { //theres a new if statement here, say hi!
    var dosc=((obj_persistent.downscroll)*2)-1; //vertical multiplier
    var songlong=audio_sound_length(songplaying);
    var songper=(songpos/songlong);
    var songbeat=((songlong/60*bpm*4)*(48*notespeed))
    y=obj_uinotes.yy+(songper*songbeat)*dosc
}

if keyboard_check_pressed(vk_space) {
	if !pausy
		audio_pause_sound(songplaying)	
	else
		audio_resume_sound(songplaying)
		
	pausy=!pausy
}

if keyboard_check_pressed(vk_escape) {
	transition_goto(rm_chartselect)	
}