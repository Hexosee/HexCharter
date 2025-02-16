function frankenswows_create() {
	with (obj_chartcontroller) {
		song = noli
		bpm = 130
		notespeed = 1
		keys = 4
		filename = "noli (frankenswows)"
		
		songlong = chart_get_songlong(song,bpm)
		var bb,b
		for (bb = 0; bb < (keys * 2); bb++)
		{
			bpm = 130
			songlong = chart_get_songlong(song,130)
		    for (b = 0; b < songlong; b++) {
		        notes[bb, b] = 0;
				if b == 144  {
					songlong = chart_get_songlong(song,160) // FRANKENSWOWS
				}
			}
			
		}
		songlong = chart_get_songlong(song,130)
		songplaying = audio_play_sound(noli,0,true)
		audio_pause_sound(songplaying)
	}
	
}

function frankenswows_save() {
	try {
		with (obj_chartcontroller) {
			filename = "noli (frankenswows)"
			songname = "noli"
			print($"{working_directory}charts/{filename}/chart.fswows")
			var file = file_text_open_write($"{working_directory}charts/{filename}/chart.fswows")	
	
			file_text_write_string(file,  $"{songname} \\ Chart made with SUPER Charter 900 (https://tinyurl.com/supercharter900)")
			file_text_writeln(file)
			file_text_write_string(file, bpm)
			file_text_writeln(file)
			file_text_write_string(file, notespeed)
			file_text_writeln(file)
			file_text_write_string(file, keys)
			file_text_writeln(file)
	
			var songlong = chart_get_songlong(song,bpm)
			var bb,b
			for (bb = 0; bb < (keys * 2); bb++)
			{
				bpm = 130
				songlong = chart_get_songlong(song,130)
			    for (b = 0; b < songlong; b++)
			    {
					if notes[bb,b] == "15" {
						songlong = chart_get_songlong(song,160)	
						file_text_write_real(file, 1600)
						file_text_writeln(file)
						continue
					}
			        file_text_write_string(file, notes[bb, b])
			        file_text_writeln(file)
			    }
			}
			songlong = chart_get_songlong(song,130)
			file_text_close(file)
		}	
	}
	catch (_exc) {
		alert_make("Something went wrong!",false)
		show_message($"ERROR WHILE SAVING!!\n{_exc.longMessage}")
	}
}

function frankenswows_load() {
	
	with (obj_chartcontroller) {

		filename = "noli (frankenswows)"

		//filename = string(working_directory) + string(argument0) + ".swows";
		song = noli
		file = file_text_open_read($"{working_directory}charts/{filename}/chart.fswows")

		songname = file_text_read_string(file)
		file_text_readln(file)
		bpm = file_text_read_real(file)
		file_text_readln(file)
		notespeed = file_text_read_real(file)
		file_text_readln(file)
		keys = file_text_read_real(file)
		
		songlong = chart_get_songlong(song,bpm)

		var b,bb
		for (bb = 0; bb < keys*2; bb++)
		{
			bpm = 130
			songlong = chart_get_songlong(song,130)
		    for (b = 0; b < songlong; b++)
		    {
				
				var toread = file_text_read_real(file)
				if toread > 1000 {
					songlong = chart_get_songlong(song,toread/10)
					bpm = toread/10
					notes[bb,b] = 15
					file_text_readln(file)
				}
				else {
			        notes[bb, b] = toread
			        file_text_readln(file)
				}
		    }
		}
		songlong = chart_get_songlong(song,130)
		bpm = 130
		file_text_close(file)
		songplaying = audio_play_sound(song,0,true)
		audio_pause_sound(songplaying)
		
	}
	return filename	
	
}