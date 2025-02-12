var b,bb,ofs 

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_main)
var scrolldist = y/(mscroll)
var sd2 = y*(mscroll/32)
var k = keys*2


for (bb = 0; bb < k; bb++)
{
	if bb >= keys 
		ofs = 10	
	else
		ofs = 0

	for (b = 0; b < songlong; b++)
	{
		// (proper) CULLING!!
		// loop will only go through the visible tiles :]
		// eat THAT charter 900 dx
		if b < -5-scrolldist 
		{ 
			b = round(-(y/32)-5)
			continue 
		} 
		if b > 20-scrolldist { break } 
		
		var notex = center+ofs+bb*32 // why do i need to add 1 to align it
		var notey = 100+b*32+sd2
		
		var col = noone
		
		var colors = [
			// onbeats (section A)
			obj_persistent.col_grid1, 
			obj_persistent.col_grid2, 
			
			// offbeats (section A)
			obj_persistent.col_grid1_offbeat,
			obj_persistent.col_grid2_offbeat,
			
			// onbeats (section B)
			obj_persistent.col_grid1_b,
			obj_persistent.col_grid2_b,
			
			// offbeats (section B)
			obj_persistent.col_grid1_offbeat_b,
			obj_persistent.col_grid2_offbeat_b
		]
		
		var beatmod = (floor(b / 4) % 2) - 1
		if beatmod >= 0 // make sure its in the range 1 - 2 (if it should be applied)
			beatmod += 2
		beatmod = max(0, beatmod) // reclamp so no negative values
		
		var sectionmod = (floor(b / 16) % 2) - 1
		if sectionmod >= 0 // keep range again (this time either 0 or 1)
			sectionmod ++
		sectionmod = max(0, sectionmod) // reclamp
		sectionmod *= 4 // scale up so the idx is correctly shifted
		
		
		// this is the easy part!
		col = colors[abs(b % 2 - bb % 2) + beatmod + sectionmod]
		
				
		draw_rectangle_color(notex,notey,notex+31,notey+31,col,col,col,col,false)
		
		switch (notes[bb,b]) {
			case 0: break
			default:
				draw_sprite_ext(spr_special,5,notex,notey,1,1,0,c_gray,1)
				draw_text_color(notex+16,notey+16,notes[bb,b],c_white,c_white,c_white,c_white,1)
			break
			case 1: // normal note
				draw_sprite(spr_notes,bb,notex,notey)
			break
			case 2: // alt note
				draw_sprite_ext(spr_notes,bb,notex,notey,1,1,0,c_gray,1)
				draw_text_color(notex+16,notey+16,"ALT",c_white,c_white,c_white,c_white,1)
			break
			case 3: // bomb
				draw_sprite(spr_bombs,bb,notex,notey)
			break
			case 4: // dude cam
				draw_sprite(spr_special,1,notex,notey)
			break
			case 5: // middle cam
				draw_sprite(spr_special,2,notex,notey)
			break
			case 6: // badguy cam
				draw_sprite(spr_special,3,notex,notey)
			break
			case 7:
				draw_sprite(spr_special,0,notex,notey)
			break
			case 8:
				draw_sprite(spr_noteshold,bb,notex,notey)
			break
			case 9:
				draw_sprite_ext(spr_noteshold,bb,notex,notey,1,1,0,c_gray,1)
				draw_text_color(notex+16,notey+16,"ALT",c_white,c_white,c_white,c_white,1)
			break		
			case 10:
				draw_sprite(spr_special,4,notex,notey)
			break
		}
		//draw_sprite(spr_dudOLD,0,center+bb*32,100+b*32)
	}
	draw_set_alpha(0.7)
		draw_sprite(spr_receptorsNEW,bb >= keys ? bb-keys : bb,center+ofs+bb*32,100)
	draw_set_alpha(1)		
}
var xx = center+curbb*32
var yy = 100+curb*32+sd2
var ofs2 = 0

if curbb >= keys
	ofs2 = 10
	
if !(curbb < 0 or curbb >= keys*2) and !(curb < 0 or curb > songlong) {
	draw_set_alpha(0.5)
	draw_rectangle_color(xx+ofs2,yy,xx+31+ofs2,yy+31,c_white,c_white,c_white,c_white,false)
}

/*
draw_set_alpha(0.7)
draw_sprite(spr_receptors,0,center,100)
draw_sprite(spr_receptors,0,center+10+128,100)
draw_set_alpha(1)
