function chart_load(filename) {
	with (obj_chartcontroller) {

		//filename = string(working_directory) + string(argument0) + ".swows";
		song = audio_create_stream($"{working_directory}charts/{filename}/song.ogg")
		file = file_text_open_read($"{working_directory}charts/{filename}/chart.swows")


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
		    for (b = 0; b < songlong; b++)
		    {
		        notes[bb, b] = file_text_read_real(file)
		        file_text_readln(file)
		    }
		}

		file_text_close(file)
		
		songplaying = audio_play_sound(song,0,true)
		audio_pause_sound(songplaying)
		
	}
	return filename
}

function chart_save(filename) {
	with (obj_chartcontroller) {
		var file = file_text_open_write($"{working_directory}charts/{filename}/chart.swows")	
	
		file_text_write_string(file, songname)
		file_text_writeln(file)
		file_text_write_string(file, bpm)
		file_text_writeln(file)
		file_text_write_string(file, notespeed)
		file_text_writeln(file)
		file_text_write_string(file, "Chart made with SUPER Charter 900 (https://tinyurl.com/supercharter900)")
		file_text_writeln(file)
	
		var songlong = chart_get_songlong(song,bpm)
		var bb,b
		for (bb = 0; bb < (keys * 2); bb++)
		{
		    for (b = 0; b < songlong; b++)
		    {
		        file_text_write_string(file, notes[bb, b])
		        file_text_writeln(file)
		    }
		}
	
		file_text_close(file)
	}		
}

function chart_save_as(filename) {
	with (obj_chartcontroller) {
		var file = file_text_open_write(filename)	
	
		file_text_write_string(file, songname)
		file_text_writeln(file)
		file_text_write_string(file, bpm)
		file_text_writeln(file)
		file_text_write_string(file, notespeed)
		file_text_writeln(file)
		file_text_write_string(file, "Chart made with SUPER Charter 900 (https://tinyurl.com/supercharter900)")
		file_text_writeln(file)
	
		var songlong = chart_get_songlong(song,bpm)
		var bb,b
		for (bb = 0; bb < (keys * 2); bb++)
		{
		    for (b = 0; b < songlong; b++)
		    {
		        file_text_write_string(file, notes[bb, b])
		        file_text_writeln(file)
		    }
		}
	
		file_text_close(file)
	}		
}

function chart_load_test() {
	with (obj_chartcontroller) {
		song = mus_tutorial
		bpm = 95
		notespeed = 1
		keys = 5
		
		songlong = chart_get_songlong(song,bpm)
		var bb,b
		for (bb = 0; bb < (keys * 2); bb++)
		{
		    for (b = 0; b < songlong; b++)
		        notes[bb, b] = 0;
		}
		songplaying = audio_play_sound(mus_tutorial,0,true)
		audio_pause_sound(songplaying)
	}
	
}

function chart_create(ssongname, bbpm, nnotespeed, songpath) {
	file_copy(songpath, $"{working_directory}charts/{ssongname}/song.ogg")
	
	songname = ssongname
	song = audio_create_stream($"{working_directory}charts/{ssongname}/song.ogg")
	print(song)
	bpm = bbpm
	print(bpm)
	notespeed = nnotespeed
	keys = 4
		
	songlong = chart_get_songlong(song,bpm)
		
	var bb,b
	for (bb = 0; bb < (keys * 2); bb++)
	{
		for (b = 0; b < songlong; b++)
		    notes[bb, b] = 0;
	}
		
	songplaying = audio_play_sound(song,0,true)
	audio_pause_sound(songplaying)
		
	print(songname)
		
	chart_save(songname)
		
}

function chart_get_songlong(song,bpm) {
	return round((audio_sound_length(song) / 60) * bpm * 4);	
}