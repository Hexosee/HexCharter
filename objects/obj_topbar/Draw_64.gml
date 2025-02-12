draw_set_alpha(0.7)
	draw_rectangle_color(0,0,1280,35,obj_persistent.col_overlay,obj_persistent.col_overlay,obj_persistent.col_overlay,obj_persistent.col_overlay,false)
draw_set_alpha(1)

draw_set_font(fnt_big)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

var wid = 0
var pad = 0
var wold = 0
var pold = 0
for (var i = 0; i<length; i++) {
	wold = wid; pold = pad
	draw_text(8+wold+pold,1,keys[i])
	wid+= string_width(keys[i])
	pad+=16
	
	
	if MOUSE_X > wold+pold and MOUSE_X < wid+pad {
		curcat = i	
	}
	
	if i == curcat and inrange {
		draw_set_alpha(0.5)
			draw_rectangle_color(wold+pold+1,0,wid+pad,35,c_white,c_white,c_white,c_white,false)
		draw_set_alpha(1)
	}
	
}

draw_set_font(fnt_dropdown)
if menuopen != noone {
	var length2 = array_length(menuopen)
	width = 0
	for (var i = 0; i<length2;i++) {
		if string_width(menuopen[i]) > width
			width = string_width(menuopen[i])
	}
	for (var i = 0; i<length2;i++) {
		draw_set_alpha(0.7)
			draw_rectangle_color(barwidth[selected]+5,40+(i*20),barwidth[selected]+11+width,60+(i*20)-1,obj_persistent.col_overlay,obj_persistent.col_overlay,obj_persistent.col_overlay,obj_persistent.col_overlay,false)
		draw_set_alpha(1)
		draw_text(barwidth[selected]+8,40+(i*20),menuopen[i])
	}
	if inrange2 {
		draw_set_alpha(0.5)
			draw_rectangle_color(barwidth[selected]+5,40+(curopt*20),barwidth[selected]+11+width,60+(curopt*20)-1,c_white,c_white,c_white,c_white,false)
		draw_set_alpha(1)
	}
}

//draw_text(mouse_x+10,mouse_y+10,string_width(keys[curcat]))

draw_set_font(fnt_main)
draw_set_valign(fa_middle)
