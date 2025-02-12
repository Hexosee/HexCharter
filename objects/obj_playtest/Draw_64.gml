

if !surface_exists(surf)
	surf = surface_create(800,800)

surface_set_target(surf)
	draw_clear_alpha(c_black,0)
	with(obj_uinotes) {
		draw_sprite_ext(spr_p_uinotes,note,x,y,image_xscale,image_yscale,0,c_white,1)
	}

	with (obj_note) {
		switch(type) {
			default: draw_sprite_ext(spr_special,5,x-32/2,y-32/2,image_xscale,image_yscale,0,c_white,1) break
		
			case 1: case 2:
				draw_sprite_ext(spr_p_notes,note,x,y,image_xscale,image_yscale,0,c_white,1)
			break
			
			case 8: case 9: // janky sustains return from dx
					var baba = image_yscale/2
					var obama=obj_playtest.notespeed/2
					var stupididiotdumb
					if obj_persistent.downscroll
						stupididiotdumb = 45*obama
					else
						stupididiotdumb = -45*obama
					if place_free(x,y-(obj_playtest.notespeed*baba)-48*obj_playtest.notespeed) { //top note cap
						draw_sprite_ext(spr_p_holdcap,note,x,stupididiotdumb+(y-(obama)-48*(obama))*2,1,-(baba*(obama*4.5)),0,c_white,image_alpha) // - 0.15 for transparent sustains
					}
					if place_free(x,y+(obj_playtest.notespeed*baba)+48*obj_playtest.notespeed) { //bottom note cap
						draw_sprite_ext(spr_p_holdcap,note,x,stupididiotdumb+(y-((obama)*baba)+48*(obama))*2,1,(baba*(obama*4.5)),0,c_white,image_alpha)
					}

					draw_sprite_ext(spr_p_holds,note,x,stupididiotdumb+(y-(obj_playtest.notespeed*baba)),1,(baba*(obj_playtest.notespeed))*2,0,image_blend,image_alpha)
			break
		}
	}
surface_reset_target()

draw_surface_ext(surf,room_width-1050,0,2,2,0,c_white,1)