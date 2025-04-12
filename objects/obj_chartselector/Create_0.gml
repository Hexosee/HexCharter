obj_persistent.creating = false // fuck my charting life

if !audio_is_playing(mus_arkaid)
	menusonglol = audio_play_sound(mus_arkaid,0,true)
else
	menusonglol = -1
charts = ["New Chart", "Select Theme", "----------"]

folder = file_find_first(working_directory + "charts/*", fa_directory)

while (folder != "") {
	array_push(charts,folder)	
	folder = file_find_next()
}

file_find_close()

sel = 0

// autosave submenu
autosave_menu = false
saves = 0
autosel = 0
yy = 0
alerp = 0 // spr_ladyfont_18

format = function(str) {
		if str == "i dont care load anyways" return str
		var raw = string_split(str,"-")
		
		var year =   raw[1]
		var month =  raw[2]
		var day =    raw[3]
		var hour =   raw[4]
		var minute = raw[5]
		var second = raw[6]
		
		switch(real(month)) {
			default: month = "glebulary" break // my new month please enjoy and liek it lots
		    case 1: month = "january" break
		    case 2: month = "february" break
		    case 3: month = "march" break
		    case 4: month = "april" break
		    case 5: month = "may" break
		    case 6: month = "june" break
		    case 7: month = "july" break
		    case 8: month = "august" break
		    case 9: month = "september" break
		    case 10: month = "october" break
		    case 11: month = "november" break
		    case 12: month = "december" break
		}
		
		if real(second) < 9
			second = $"0{second}"
		
		return $"{month} {day} {year} @ {hour}:{minute}"
}