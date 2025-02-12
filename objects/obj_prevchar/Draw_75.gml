shader_set(sh_colorreplace)

shader_set_uniform_f_array(shad_targ, [0, 0, 0])
shader_set_uniform_f_array(shad_rep, [color_get_red(obj_persistent.col_bg)/255, color_get_green(obj_persistent.col_bg)/255, color_get_blue(obj_persistent.col_bg)/255])

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, image_blend, 1)

shader_reset()

exit