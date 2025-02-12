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
					chart_save(obj_chartcontroller.filename)
					alert_make("Chart saved!")
				break
				case 2:
					var file
					print(obj_chartcontroller.songname)
					file = get_save_filename($"fnffd chart|*.swows", $"{obj_chartcontroller.songname}.swows");
					if file != "" {
						chart_save_as(file)
						alert_make("Chart saved!")
					}
				break
				case 3: // Exit (technically load if you think about it)
					if !instance_exists(obj_transition) {
						transition_goto(rm_chartselect)
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
		case 2:
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
			}
		break
	}
}