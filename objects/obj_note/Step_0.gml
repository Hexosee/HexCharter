y=yy+(obj_playtest.y-(obj_uinotes.y))
x=xx+obj_playtest.x
obj_playtest.hitthisstep = [false,false,false,false]

    // note offscreen
if obj_persistent.downscroll=false {
    if (y <= -60 && (type=1 or type=2 or type=8 or type=9) && note >= 4) {
        instance_destroy();
        obj_playtest.misses+=1
        obj_playtest.coolscore-=50
    }
} else {
    if (y >= 500 && (type=1 or type=2 or type=8 or type=9) && note >= 4) {
        instance_destroy();
        obj_playtest.misses+=1
        obj_playtest.coolscore-=50
    }
}

if note < 4 { //enemy

	//hitbox fix
	var fuckup, fuckdown
	fuckup = obj_persistent.downscroll ? 0 : 100
	fuckdown = obj_persistent.downscroll ? 100 : 0

	if y <= obj_uinotes.y+64+fuckdown && y >= obj_uinotes.y-64-fuckup { //14
	    switch(type) {
	        case 1: case 2:
				if (y <= obj_uinotes.y+(8)+fuckdown && y >= obj_uinotes.y-(8)-fuckup) {
					with(obj_uinotes) {
						if other.note == note {
							press = true
							alarm[0] = 2/(60/game_get_speed(gamespeed_fps))
						}
					}
			        instance_destroy()
				}
	        break
			case 8: case 9:
				with(obj_uinotes) {
					if other.note == note {
						press = true
						alarm[0] = 2/(60/game_get_speed(gamespeed_fps))
					}
				}
			    instance_destroy()
			break
	    }
	}
}
else {
    if (y <= obj_uinotes.y+(64) && y >= obj_uinotes.y-(64) && hitable=true) {
        switch(type) {
            case 1: case 2:
                if keyboard_check_pressed(obj_persistent.bind[note-4]) and not obj_playtest.hitthisstep[note-4] {
					obj_playtest.hitthisstep[note-4] = true
                    obj_playtest.coolscore+=100
					with (obj_uinotes) {
						if note == other.note {
							hit[note-3] = true	
						}
					}
                    instance_destroy();
                }
            break
            case 8: case 9:
	                if keyboard_check(obj_persistent.bind[note-4]) {
	                    obj_playtest.coolscore+=25
	                    instance_destroy();
	                }
            break
        }
    }
}