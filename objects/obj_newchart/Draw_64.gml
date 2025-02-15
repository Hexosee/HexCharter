draw_tiled_background()

draw_set_font(fnt_big)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(10,10,"New Chart")

draw_set_font(fnt_big)

var i
var l = array_length(opts)
for (i=0; i < l; i++) {	
	lol = 0
	if sel != i
		draw_set_color(c_gray)
	else
		draw_set_color(c_white)
		
	draw_set_alpha(sin(1-abs(sel-i)/10))
		
	if opts[i] == "Done!" 
		lol = 30
		
	if opts[i] == "Back"
		lol = -30
		
	draw_text(30+ofs[i],room_height/2+(i*25)-y+lol,opts[i])
}

y = lerp(y,sel*25,d(0.2))

draw_set_color(c_white)
draw_set_alpha(1)