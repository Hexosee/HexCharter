if warningup {
	var ww = window_get_width()
	var wh = window_get_height()
	
	// fade back
	draw_set_color(col_overlay)
	draw_set_alpha(0.5)
	draw_rectangle(0,0,ww,wh,false)
	draw_set_alpha(1)
	
	// outline
	draw_set_color(col_grid2_offbeat)
	draw_rectangle(ww*.1-4,wh*.1-4,ww*.9+4,wh*.9+4,false)
	// main box
	draw_set_color(col_grid2)
	draw_rectangle(ww*.1,wh*.1,ww*.9,wh*.9,false)
	
	// heads up underline
	draw_set_color(col_grid2_offbeat_b)
	
	for(var ahh = 0; ahh <= 5; ahh++) {
		draw_line(ww/2-250, wh*.1+100+ahh,ww/2+250,wh*.1+100+ahh)
	}
	
	// title
	draw_set_color(c_white)
	draw_set_font(fnt_big)
	draw_set_halign(fa_center)
	draw_text_transformed(ww/2+7,wh*.1+25,"HEADS UP!!!", 2, 2, 0) // its just not big enough!
	
	// body
	draw_text(ww/2+7,wh*.1+115,"You have some files in your 'custom/' folder that don't\npoint to any existing asset!")

	// file list
	var showfiles = [] //"custom/ex1.png", "custom/ex2.ogg", "custom/ex3.swows", "custom/ex4.aaaahhhhh"
	array_copy(showfiles,0,invalidfiles,0,3)
	
	var showstring = ""
	for(var i = 0; i < array_length(showfiles); i++) {
		showstring += showfiles[i] + "\n"	
	}
	if array_length(showfiles) < array_length(invalidfiles) {
		showstring += $"\n(...and {array_length(invalidfiles)-array_length(showfiles)} more)"
	}
	
	draw_set_valign(fa_middle)
	draw_text_ext(ww/2,wh/2,showstring,30,ww*.8)
	
	// readme notice
	draw_set_valign(fa_top)
	draw_text(ww/2,wh*.67,"Review 'README.txt' for a list of valid asset names!")
	
	// button
	draw_set_color(col_grid1_b)
	draw_rectangle(ww/2-200,wh*.9-100,ww/2+200,wh*.9-20,false)
	// button text
	draw_set_color(c_white)
	draw_set_valign(fa_middle)
	draw_text_transformed(ww/2,wh*.9-65,"ok",2,2,0)
	// change highlight depending on mouse SHITS!
	if MOUSE_X >= ww/2-200 and MOUSE_X <= ww/2+200 and MOUSE_Y >= wh*.9-100 and MOUSE_Y <= wh*.9-20 {
		draw_set_alpha(0.3)
		if mouse_check_button(mb_left) and buttonlatch draw_set_color(c_black)
		draw_rectangle(ww/2-200,wh*.9-100,ww/2+200,wh*.9-20,false)
		draw_set_alpha(1)
	}
}

draw_set_color(c_white)

draw_set_font(fnt_main)
draw_set_halign(fa_right)
if room == rm_charter {
	draw_set_valign(fa_middle)
	draw_text(1270,50,$"{fps} fps\n{obj_chartcontroller.zoom}x")
}
else {
	draw_set_valign(fa_top)
	draw_text(1270,10,$"{fps} fps")	
}