if !audio_is_playing(mus_arkaid)
	menusonglol = audio_play_sound(mus_arkaid,0,true)
else
	menusonglol = -1
charts = ["New Chart"]

folder = file_find_first(working_directory + "charts/*", fa_directory)

while (folder != "") {
	array_push(charts,folder)	
	folder = file_find_next()
}

sel = 0