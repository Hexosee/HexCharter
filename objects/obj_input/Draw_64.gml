draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_dropdown)
draw_set_alpha(0.7)
draw_set_color(obj_persistent.col_overlay)

// main box
draw_rectangle(room_width/2-string_width(str),room_height/2-100,room_width/2+string_width(str),room_height/2+100,false)
	
draw_set_alpha(0.9)

// textbox
draw_rectangle(room_width/2-keywidth,50+room_height/2-25,room_width/2+keywidth,50+room_height/2+25,false)

draw_set_alpha(1)
draw_set_color(c_white)

draw_text(room_width/2,room_height/2-50,str)
draw_text(room_width/2,50+room_height/2,keyboard_string)