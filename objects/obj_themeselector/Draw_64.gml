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

draw_set_color(c_white)
draw_set_alpha(1)