if going == "up" 
	y = lerp(y,room_height-50,d(0.2))
else {
	y-=d(increase)
	increase-=d(0.25)
	if lerped > room_height+10
		instance_destroy()
}