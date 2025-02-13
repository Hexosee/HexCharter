draw_rectangle_color(5,680-5,320+5,720-5,obj_persistent.col_overlay,obj_persistent.col_overlay,obj_persistent.col_overlay,obj_persistent.col_overlay,false)
var l = array_length(notelist)

var mx = floor(5+(mouse_x/35))-5
var my = mouse_y

var fuck = (mouse_x > 5 and mouse_x < 320) and (my > 675 and my < 715)

for (var i = 0; i<l; i++) {
	draw_set_halign(fa_center)
	draw_sprite(notelist[i][0],notelist[i][1],10+(i*35),680)
	if fuck and mx == i {
		draw_text(320/2,655,notelist[i][2])
		draw_set_alpha(0.5)
			draw_sprite(spr_dudOLD,0,10+(i*35),680) // fuck rectangles
		draw_set_alpha(1)
	}
	if curtype-1 == i or (i == 7 and curtype == 10) or (i == 8 and curtype == -1) {
		draw_sprite_ext(spr_dudOLD,0,10+(i*35),680,1,1,0,c_white,0.4)
		draw_set_halign(fa_right)
		draw_set_valign(fa_middle)
		draw_text(room_width-5,705,$"Selected: {notelist[i][2]}")
	}
}



if mx == 8 and customtype <= 12 and fuck {
	draw_set_halign(fa_left)
	draw_text(10,600,"Note types 11 and 12 are taken by unused firework notes!!\nYou should remove the code for them in\nobj_note's step event if you're planning to use them.")
}


var ymod = (round(sin(current_time/650)*4))
draw_sprite_ext(spr_previewplatform,0,room_width - (center/2), room_height*.8 + ymod,1,1,0,c_white,1)

prevdude.y = room_height*.835 + ymod
prevbadguy.y = prevdude.y