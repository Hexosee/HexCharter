mscroll = 32
paused = true

curbb = 0
curb = 0

curtype = 1

notelist = [[spr_notes,2,"Normal Note"],[spr_notes,1,"Alt Note"],[spr_bombs,1,"Bomb Note"],[spr_special,1,"Camera Pan (PLAYER)"],[spr_special,2,"Camera Pan (MIDDLE)"],[spr_special,3,"Camera Pan (BADGUY)"],[spr_special,0,"Ayy Note"],[spr_special,4,"Event Note"],[spr_special,5,"Custom Note"]]
notecollist = [c_purple, c_blue, c_green, c_red]

//show_debug_overlay(true)
if obj_persistent.creating == false 
	filename = chart_load(obj_persistent.thischart)
else {
	chart_create(obj_persistent.songname,obj_persistent.bpm,obj_persistent.sspeed,obj_persistent.songpath)
	filename = obj_persistent.songname	
}
//chart_load_test()

center = (room_width/2-keys*32)-keys

customtype = 11 // dont go into the normal notes !!

// 11 and 12 are taken by the unused firework notes that were made for weeknd 4

zoom = 1
zlerp = 1

// my realm... where the variables for MY features go..

last_autosave_time = date_current_datetime() // it doesnt actually autosave here... just makes it more convenient later
// make autosave dir cause it wont work if i dont
autosave_dir = $"{working_directory}charts/{filename}/autosaves"
if !directory_exists(autosave_dir)
    directory_create(autosave_dir)

play_metronome = false

play_hitsounds = false
hitsound_id_blacklist = [4, 5, 6, 8, 9]

// to prevent repeated ticks
last_hovered_step = 0

// set up children
prevdude = instance_create_depth(room_width - (center/2)+45, room_height*.845,-9999,obj_prevchar)

prevbadguy = instance_create_depth(room_width - (center/2)-45, room_height*.845,-9999,obj_prevchar)
// setup badguy anims
prevbadguy.idle_anim = spr_prebadguy_idle
prevbadguy.pause_anim = spr_prebadguy_pause
prevbadguy.ayy_anim = spr_prebadguy_ayy

prevbadguy.anims = [spr_prebadguy_left, spr_prebadguy_down, spr_prebadguy_up, spr_prebadguy_right]
prevbadguy.alt_anims = [spr_prebadguy_left_a, spr_prebadguy_down_a, spr_prebadguy_up_a, spr_prebadguy_right_a]
prevbadguy.bomb_anims = [spr_prebadguy_left_b,spr_prebadguy_down_b,spr_prebadguy_up_b,spr_prebadguy_right_b]
// for quick iteration later
prevchars = [prevdude, prevbadguy]

curr_cam_targ = 3