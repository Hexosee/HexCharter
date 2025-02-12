if not paused {
	image_speed = base_image_speed
	if image_index >= sprite_get_number(cur_anim)-1 or cur_anim == idle_anim {
		active = false
		if image_index >= sprite_get_number(cur_anim)-1 {
			image_speed = 0
		}
	} else {
		active = true
	}
	sprite_index = cur_anim
} else {
	sprite_index = pause_anim
	image_speed = 0
}

