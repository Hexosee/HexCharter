draw_tiled_background(curr_back_col, curr_fore_col)
curr_alpha_lerp = lerp(curr_alpha_lerp, 1, d(0.1))
draw_tiled_background(targ_back_col, targ_fore_col, curr_alpha_lerp, 0)

draw_set_font(fnt_big)

y = lerp(y,sel*25,d(0.2))

draw_set_font(fnt_big)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(10,10,"pick you'r them,e")

var i
var l = array_length(themes)
for (i=0; i < l; i++) {
	
	if i+10<sel { continue } 
	if i>10+sel { continue }
	
	
	if sel != i
		draw_set_color(c_gray)
	else
		draw_set_color(c_white)
		
	draw_set_alpha(sin(1-abs(sel-i)/10))
		
	draw_text(30,room_height/2+(i*25)-y,themes[i][0])
}

draw_set_alpha(1)
if themes[sel][0] != "Back" and themes[sel][0] != "" {
	var ww = window_get_width()
	var wh = window_get_height()
	
	draw_set_color(c_black)
	draw_set_alpha(0.5)
		draw_rectangle(ww-500-20,wh/2-500/2,ww-16+4,wh/2+500/2+4+4,false)
	draw_set_alpha(1)
	draw_rectangle(ww-500-20-4,wh/2-500/2-4,ww-16,wh/2+500/2+4,false)
	
	
	if last_prevsprite != noone draw_sprite_ext(last_prevsprite,0,ww-20,wh/2,1,1,0,c_white,1)
	
	var alphlerp = last_prevsprite != noone ? curr_alpha_lerp : 1
	draw_sprite_ext(curr_prevsprite,0,ww-20,wh/2,1,1,0,c_white,alphlerp)
}

draw_set_color(c_white)
draw_set_alpha(1)