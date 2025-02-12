lerped = lerp(lerped,y-(num*55),d(0.12))

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_dropdown)
draw_set_alpha(0.5)
draw_set_color(obj_persistent.col_overlay)
	draw_rectangle(room_width/2-string_width(str),lerped-25,room_width/2+string_width(str),lerped+25,false)
draw_set_alpha(1)
draw_set_color(c_white)

draw_text(room_width/2,lerped,str)