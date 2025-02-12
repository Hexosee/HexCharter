mscroll = 32
paused = true

curbb = 0
curb = 0

curtype = 1

notelist = [[spr_notes,2,"Normal Note"],[spr_notes,1,"Alt Note"],[spr_bombs,1,"Bomb Note"],[spr_special,1,"Camera Pan (PLAYER)"],[spr_special,2,"Camera Pan (MIDDLE)"],[spr_special,3,"Camera Pan (BADGUY)"],[spr_special,0,"Ayy Note"],[spr_special,4,"Event Note"],[spr_special,5,"Custom Note"]]

//show_debug_overlay(true)
if obj_persistent.creating == false 
	filename = chart_load(obj_persistent.thischart)
else
	chart_create(obj_persistent.songname,obj_persistent.bpm,obj_persistent.sspeed,obj_persistent.songpath)
//chart_load_test()

center = (room_width/2-keys*32)-keys

customtype = 11 // dont go into the normal notes !!

// 11 and 12 are taken by the unused firework notes that were made for weeknd 4
// add disclasimer

play_metronome = false

play_hitsounds = false
hitsound_id_blacklist = [4, 5, 6, 8, 9]

// to prevent repeated ticks
last_hovered_step = 0