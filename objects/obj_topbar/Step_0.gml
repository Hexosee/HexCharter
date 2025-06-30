//curcat = floor(mouse_x/80)
//curcat = clamp(curcat,0,array_length(keys)-1)

curopt = floor(MOUSE_Y/20)-2
curopt = clamp(curopt,0,array_length(menuopen)-1)

inrange = (MOUSE_Y < 35 and MOUSE_Y > 0) and (MOUSE_X < barwidth[array_length(barwidth)-1] and MOUSE_X > 0)
if inrange and mouse_check_button_pressed(mb_left) {
	
	if curcat == selected {
		menuopen = noone
		selected = -1
	}
	else {
		menuopen = barstruct[$ realkeys[curcat]]
		selected = curcat
	}
	
}

inrange2 = (MOUSE_Y > 40 and MOUSE_Y < 60+((array_length(menuopen)-1)*20)-1) and (MOUSE_X > selected*80+5 and MOUSE_X < (selected*80)+11+width)

if inrange2 and mouse_check_button_pressed(mb_left) {
	switch (curcat) { // switchception.
		case 0:
			switch (curopt) {
				case 0: // New
					transition_goto(rm_newchart)
				break
				case 1: // Save
					chart_save(obj_chartcontroller.filename) // whoopsies
					alert_make("Chart saved!")
					
					// clear autosaves (you just saved)
					if directory_exists(obj_chartcontroller.autosave_dir) {
						var autosaves = []
					    var file = file_find_first(obj_chartcontroller.autosave_dir + "/*.swows", fa_none)
						
					    while file != "" {
							array_push(autosaves, file)
							file = file_find_next()
						}
					    file_find_close()
						
						if array_length(autosaves) != 0
							for(var i = 0; i < array_length(autosaves); i++)
								file_delete(obj_chartcontroller.autosave_dir + "/" + autosaves[i])
					}
				break
				case 2:
					var file
					print(obj_chartcontroller.songname)
					file = get_save_filename($"fnffd chart|*.swows", $"{obj_chartcontroller.filename}.swows");
					if file != "" {
						chart_save_as(file, obj_chartcontroller.filename)
						alert_make("Chart saved!")
					}
				break
				case 3: // Exit (technically load if you think about it)
					if !instance_exists(obj_transition) {
						transition_goto(rm_chartselect)
						obj_persistent.is_autosave = false
					}
				break
			}
		break
		case 1:
			switch (curopt) {
				case 0:
					url_open("https://hexose.gitbook.io/dx-modding-guide/basic-tutorials/custom-songs")
				break
			}
		break
		case 2: // edit
			var cursection = abs((floor((obj_chartcontroller.y-1)/(obj_chartcontroller.mscroll*16)))+1) // stupid math ahhhh
			print(cursection)
			switch(curopt) {
				case 0: // copy last section
					if cursection != 0 {
						for (var j = 0; j < obj_chartcontroller.keys*2; j++) {
							for (var i = 0; i < 16; i++) {
								obj_chartcontroller.notes[j, (cursection)*16+i] = obj_chartcontroller.notes[j, (cursection-1)*16+i]
							}
						}
					}
					menuopen = noone
					selected = -1
				break
				case 1: // swap section
					var notecopy = []
					// fuck my life
					for (var j = 0; j < obj_chartcontroller.keys*2; j++)
						for (var i = 0; i < 16; i++) 
							notecopy[j, i] = obj_chartcontroller.notes[j, cursection*16+i]
						
					for (var j = 0; j < obj_chartcontroller.keys*2; j++) {
						var modded = (j+obj_chartcontroller.keys)%((obj_chartcontroller.keys*2))
						for (var i = 0; i < 16; i++)
							obj_chartcontroller.notes[j, (cursection)*16+i] = notecopy[modded, i]
					}	
					menuopen = noone
					selected = -1
				break
				case 2: // copy section
					copiedsection = []
					for (var j = 0; j < obj_chartcontroller.keys*2; j++)
						for (var i = 0; i < 16; i++)
							copiedsection[j, i] = obj_chartcontroller.notes[j, cursection*16+i]
					
					alert_make("Copied section!", false, 5)
					menuopen = noone
					selected = -1
				break
				case 3: // paste section
					for (var j = 0; j < obj_chartcontroller.keys*2; j++)
						for (var i = 0; i < 16; i++)
							obj_chartcontroller.notes[j, cursection*16+i] = copiedsection[j, i]
							
					menuopen = noone
					selected = -1
				break
				case 4: // autosave and clear
					with obj_chartcontroller {
						var now = date_current_datetime()
						// IT'S AUTOSAVING TIME!
						last_autosave_time = now
		
						// probably not necessary but who knows
						var year =   date_get_year(now)
						var month =  date_get_month(now)
						var day =    date_get_day(now)
						var hour =   date_get_hour(now)
						var minute = date_get_minute(now)
						var second = date_get_second(now)
						chart_save_as($"{working_directory}charts/{filename}/autosaves/chart_autosave-{year}-{month}-{day}-{hour}-{minute}-{second}.swows")
						alert_make("Autosaved chart!", false, 10)
		
						var bb,b
						for (bb = 0; bb < (keys * 2); bb++)
						{
							for (b = 0; b < songlong; b++)
							    notes[bb, b] = 0;
						}
					}
					menuopen = noone
					selected = -1
				break
			}
		break
		case 3: // tools
			switch(curopt) {
				case 0:
					obj_chartcontroller.play_metronome = !obj_chartcontroller.play_metronome
					var status = (obj_chartcontroller.play_metronome) ? "on" : "off"
					alert_make("Metronome now set to " + status, false, 10)
					menuopen = noone
					selected = -1
				break
				case 1:
					obj_chartcontroller.play_hitsounds = !obj_chartcontroller.play_hitsounds
					var status = (obj_chartcontroller.play_hitsounds) ? "on" : "off"
					alert_make("Hitsounds now set to " + status, false, 10)
					menuopen = noone
					selected = -1
				break
				case 2:
					obj_chartcontroller.livemode = !obj_chartcontroller.livemode
					var status = (obj_chartcontroller.livemode) ? "on" : "off"
					alert_make("Live mode now set to " + status, false, 10)
					menuopen = noone
					selected = -1
				break
			}
		break
	}
}