x+=d(0.5)
draw_sprite_tiled_ext(spr_chartselbg,0,x,x,2,2,c_white,1)

draw_set_font(fnt_big)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(10,10,"SUPER charter 900")

draw_set_font(fnt_big)

y = lerp(y,sel*25,d(0.2))

var i
var l = array_length(charts)
for (i=0; i < l; i++) {
	
	if i+10<sel { continue } 
	if i>10+sel { continue }
	
	
	if sel != i
		draw_set_color(c_gray)
	else
		draw_set_color(c_white)
		
	draw_set_alpha(sin(1-abs(sel-i)/10))
		
	draw_text(30,room_height/2+(i*25)-y,charts[i])
}

draw_set_color(c_white)
draw_set_alpha(1)

// CREDITS
draw_set_halign(fa_right)
draw_set_font(fnt_main)
draw_text(room_width-5,room_height-80,"made by hexose")
draw_text(room_width-5,room_height-60,"some contributions by kayla")
draw_text(room_width-5,room_height-40,"delta by gm-core")
draw_text(room_width-5,room_height-20,"inspired by codename engine (lols)")