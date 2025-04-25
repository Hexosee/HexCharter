

if !surface_exists(surf)
	surf = surface_create(800,800)

surface_set_target(surf)
	draw_clear_alpha(c_black,0) //reset alpha
	//draw ui notes
	if instance_exists(obj_uinotes) {
	    with(obj_uinotes) {
	        draw_sprite_ext(spr_p_uinotes,note,x*2,y*2,2,2,0,image_blend,1)
	        if press=true draw_sprite_ext(spr_p_uinotes,note,x*2,y*2,2,2,0,c_black,0.5);            
	    }
	}
	//draw notes
	if instance_exists(obj_note) {
	    with(obj_note) {
	        //notes
			var start = 48
			if obj_persistent.downscroll start = 352
	        switch(type) {
	            case 1: case 2: //regular notes
	                draw_sprite_ext(spr_p_notes,note,x*2,y*2,2,2,0,image_blend,image_alpha)
	            break;
	            case 3: //bombs
	                draw_sprite_ext(spr_p_bombs,note,x*2,y*2,2,2,0,c_white,image_alpha)
	            break;
	            case 8: case 9: //hold
	                var obama=obj_playtest.notespeed
	                if place_free(x,y-(obama*image_yscale)-48*obama) { //top note cap
	                    draw_sprite_ext(spr_p_holdcap,note,x*2,((y)-48*(obama*2))*2+0+obama*(48*obama)+obama*2,-2,-2,0,c_white,image_alpha)
	                }
	                if place_free(x,y+(obama*image_yscale)+48*obama) {  //bottom note cap
	                    draw_sprite_ext(spr_p_holdcap,note,x*2,((y)+48*(obama*2))*2+0-obama*(48*obama)-obama*2,2,2,0,c_white,image_alpha)
	                }
	                draw_sprite_ext(spr_p_holds,note,x*2,(y-(obj_playtest.notespeed*image_yscale))*2,2,(image_yscale*(obj_playtest.notespeed*2))*2,0,image_blend,image_alpha)
	            break;
	            case 10: //event notes
	                draw_sprite_ext(spr_special,4,x*2-32,y*2-32,2,2,0,c_white,1)
	                draw_sprite_ext(spr_special,4,x*2-32,y*2-32,2,2,0,c_white,1)
	                draw_text_transformed_color(x*2-32,y*2-32,event,2,2,0,c_green,c_green,c_green,c_green,1)
	            break;
	            default:
	                draw_sprite_ext(spr_special,5,x*2-32,y*2-32,2,2,0,c_white,1)
	                draw_sprite_ext(spr_special,5,x*2-32,y*2-32,2,2,0,c_white,1)
	                draw_text_transformed_color(x*2-32,y*2-32,type,2,2,0,#C454FD,#C454FD,#8F2EC7,#8F2EC7,1)
	            break;
	        }
	    }
	}
surface_reset_target()


draw_surface_ext(surf,room_width-1050,0,1,1,0,c_white,1)

draw_set_font(fnt_big)
draw_set_halign(fa_center)
draw_outlined_text(room_width/2,room_height-50,$"score: {coolscore} | misses: {misses}",c_white,1,0,4)