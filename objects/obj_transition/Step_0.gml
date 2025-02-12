if fadein == true {
	alph+=d(0.1)
	if alph >= 1 {
		room_goto(roomto)
		fadein = false
	}
}

if fadein == false {
	alph-=d(0.1)
	if alph <= 0 {
		instance_destroy()	
	}
}