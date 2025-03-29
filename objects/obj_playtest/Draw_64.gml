

if !surface_exists(surf)
	surf = surface_create(800,800)

surface_set_target(surf)
	draw_clear_alpha(c_black,0)
	with(obj_uinotes) {
		draw_sprite_ext(spr_p_uinotes,note,x,y,image_xscale,image_yscale,0,c_white,1)
		if press
			draw_sprite_ext(spr_p_uinotes,note,x,y,image_xscale,image_yscale,0,c_black,0.5)
	}

	with (obj_note) {
		switch(type) {
			default: draw_sprite_ext(spr_special,5,x-32/2,y-32/2,image_xscale,image_yscale,0,c_white,1) break
		
			case 1: case 2:
				draw_sprite_ext(spr_p_notes,note,x,y,image_xscale,image_yscale,0,c_white,1)
			break
			case 3:
				draw_sprite_ext(spr_p_bombs,note,x,y,image_xscale,image_yscale,0,c_white,1) // spr_p_bombs instead of bombs cause of offsets
			break
			
            case 8: case 9: //hold
                var obama=obj_playtest.notespeed
                if place_free(x,y+(obama*image_yscale)+48*obama) { { //bottom note cap
                    draw_sprite_ext(spr_p_holdcap,note,x,y+48*(obama*2)-obama*(48*obama)-obama*2,1,1,0,c_white,image_alpha)
                }}
                draw_sprite_ext(spr_p_holds,note,x,y-(obama),1,obama,0,image_blend,image_alpha)
                draw_sprite_ext(spr_p_holdcap,note,x,y-48*(obama*2)+obama*(48*obama)+obama*2,-1,-1,0,c_white,image_alpha)
            break;
		}
	}
surface_reset_target()


draw_surface_ext(surf,room_width-1050,0,2,2,0,c_white,1)

draw_set_font(fnt_big)
draw_set_halign(fa_center)
draw_outlined_text(room_width/2,room_height-50,$"score: {coolscore} | misses: {misses}",c_white,1,0,4)