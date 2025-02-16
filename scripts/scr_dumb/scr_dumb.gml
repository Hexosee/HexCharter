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

function folder_is_empty(path) {
	if !directory_exists(path) return false
	var goog = file_find_first(path+"*",fa_none)
	file_find_close()
	return (goog != "")
}

function folder_get_files(path) {
	var i = 0
	var filez = []
	var file = file_find_first(path,fa_none)
	while (file != "") {
		filez[i] = file	
		i++
		file = file_find_next()
	}
	file_find_close()
	return filez
}

function draw_tiled_background(back = obj_persistent.col_overlay, fore = obj_persistent.col_grid2, alpha = 1, xmod = 1) {
	static tilex = 0
	tilex+=(d(0.5))*xmod
	
	draw_set_color(back)
	draw_set_alpha(alpha)
	draw_rectangle(0, 0, room_width, room_height, false)
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_sprite_tiled_ext(spr_chartselbg,0,tilex,tilex,2,2,fore,alpha)
}

#macro MOUSE_X device_mouse_x_to_gui(0)
#macro MOUSE_Y device_mouse_y_to_gui(0)