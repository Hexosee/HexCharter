delta_step()


if keyboard_check_pressed(vk_f1) {
	config.charter.curtheme = get_string("give theme",config.charter.curtheme)
	theme_load(config.charter.curtheme)
}