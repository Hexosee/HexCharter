idle_anim = spr_predude_idle
pause_anim = spr_predude_pause
anims = [spr_predude_left, spr_predude_down, spr_predude_up, spr_predude_right]

active = false
cur_anim = idle_anim

base_image_speed = 7
image_speed = base_image_speed

paused = true

// shader shits
shad_targ = shader_get_uniform(sh_colorreplace, "targColor")
shad_rep = shader_get_uniform(sh_colorreplace, "repColor")

// prevent default draw code
image_alpha = 0