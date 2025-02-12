// ripped from glob adventure
#macro CONFIG obj_persistent.config

function config_load() {
	with (obj_persistent) {
		if file_exists(game_save_id+"config.json") {
			var file = file_text_open_read(game_save_id+"/config.json")
				var json = file_text_read_string(file)
			file_text_close(file)
		
		
			var conf = json_parse(json)
			CONFIG = conf
			if CONFIG.ver != config_ORIG.ver {
				
				CONFIG = struct_merge(CONFIG,config_ORIG,false)
				show_debug_message("savedata merged!")
			}

	
		}
	}
}


function config_save() {
	print("SAVING!!")
	with (obj_persistent) {
		var json = json_stringify(CONFIG,false) // sorry pretty print fans.. i'm LAZY.
	
		var file = file_text_open_write(game_save_id+"/config.json")
			file_text_write_string(file,json)
		file_text_close(file)
	
	}
}

function struct_merge(primary, secondary, shared)	{
	var _ReturnStruct = primary;
	
	if (shared)	{
		var _PropertyNames = variable_struct_get_names(primary);
		for (var i = 0; i < array_length(_PropertyNames); i ++)	{
			if (variable_struct_exists(secondary, _PropertyNames[i]))	{
				variable_struct_set(_ReturnStruct, _PropertyNames[i], variable_struct_get(secondary, _PropertyNames[i]));
			}
		}
	}	else	{
		var _PropertyNames = variable_struct_get_names(secondary);
		for (var i = 0; i < array_length(_PropertyNames); i ++)	{
			variable_struct_set(_ReturnStruct, _PropertyNames[i], variable_struct_get(secondary, _PropertyNames[i]));
		}
	}
	return _ReturnStruct;
}