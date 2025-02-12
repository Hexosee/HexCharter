#macro SAVES obj_persistent.saves

function config_load() {
	with (obj_persistent) {
		if file_exists("saves.json") {
			var file = file_text_open_read("saves.json")
				var json = file_text_read_string(file)
			file_text_close(file)
		
		
			var conf = json_parse(json)
			SAVES = conf
			if SAVES.ver != saves_ORIG.ver {
				
				SAVES = struct_merge(SAVES,saves_ORIG,false)
				show_debug_message("savedata merged!")
			}

	
			//printf("config","config loaded :3")
		}
			//printf("config","baby's first glob adventure")
	}
}


function config_save() {
	with (obj_persistent) {
		var json = json_stringify(SAVES,false) // sorry pretty print fans.. i'm LAZY.
	
		var file = file_text_open_write("config.json")
			file_text_write_string(file,json)
		file_text_close(file)
	
		//printf("config","config saved :3")
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