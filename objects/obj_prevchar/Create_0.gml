idle_anim = spr_predude_idle
pause_anim = spr_predude_pause
ayy_anim = spr_predude_ayy

anims = [spr_predude_left, spr_predude_down, spr_predude_up, spr_predude_right]
alt_anims = anims
bomb_anims = [spr_predude_left_b, spr_predude_down_b, spr_predude_up_b, spr_predude_right_b]

active = false
cur_anim = idle_anim

base_image_speed = 9
image_speed = base_image_speed

paused = true

// shader shits
shad_targ = shader_get_uniform(sh_prevcolorreplace, "targColor")
shad_rep = shader_get_uniform(sh_prevcolorreplace, "repColor")
shad_texsize = shader_get_uniform(sh_prevcolorreplace, "textureSize")

// prevent default draw code
image_alpha = 0