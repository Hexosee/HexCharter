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

function alert_make(str) {
	audio_play_sound(snd_josh,0,false)
	var obj = instance_create_depth(0,0,0,obj_alert)	
	obj.str = str
	obj.num = instance_number(obj_alert)-1
}