function print() {
	var r = string(argument[0]), i;
	for (i = 1; i < argument_count; i++) {
	    r += ", " + string(argument[i])
	}	
	show_debug_message($"{object_get_name(id.object_index)}: {r}")
}

function transition_goto(roomto) {
	var obj = instance_create_depth(0,0,0,obj_transition)	
	obj.roomto = roomto
}

function alert_make(str, play_sound = true, alert_time = 30) {
	if play_sound
		audio_play_sound(snd_josh,0,false)
	var obj = instance_create_depth(0,0,0,obj_alert)	
	obj.alarm[0] = alert_time/(60/game_get_speed(gamespeed_fps))
	obj.str = str
	obj.num = instance_number(obj_alert)-1
}

function is_scrolling_down() {
	if !keyboard_check(vk_control)
		return mouse_wheel_down()
	else
		return false
}

function is_scrolling_up() {
	if !keyboard_check(vk_control)
		return mouse_wheel_up()
	else
		return false
}


#macro MOUSE_X device_mouse_x_to_gui(0)
#macro MOUSE_Y device_mouse_y_to_gui(0)