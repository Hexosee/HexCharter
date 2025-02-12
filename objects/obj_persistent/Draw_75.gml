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