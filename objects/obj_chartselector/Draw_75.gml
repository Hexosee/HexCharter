if autosave_menu {
	
	var gog = (autosel > 0 ? 1 : 0)
	
	yy = lerp(yy,(autosel+gog)*25,d(0.2))
	alerp = lerp(alerp,0,d(0.2))
	draw_set_halign(fa_center)
	draw_set_font(fnt_big)
	
	var text = array_length(saves)-1 > 1 ? $"{array_length(saves)-1} autosaves found" : $"{array_length(saves)-1} autosave found"
	var xx = 350+alerp
	
	draw_set_alpha(sin(1-abs(autosel)/10))
	draw_text(xx,room_height/2-33-yy,text)
	draw_line_width(xx-string_width(text)/2,room_height/2-yy,xx+string_width(text)/2,room_height/2-yy,3)
	for (var i = 0; i<array_length(saves);i++) {
		if i+10<autosel { continue } 
		if i>10+autosel { continue }
		
		if autosel != i
			draw_set_color(c_gray)
		else
			draw_set_color(c_white)
		
		draw_set_alpha(sin(1-abs(autosel-i)/10))
		
		var lol = 0
		if saves[i] != "i dont care load anyways"
			lol=25
		
		draw_set_halign(fa_left)
		draw_text(350-string_width(text)/2+alerp,room_height/2-yy+lol+25*i,format(saves[i]))
	}
	
}