idle_anim = spr_predude_idle
pause_anim = spr_predude_pause
ayy_anim = noone

anims = [spr_predude_left, spr_predude_down, spr_predude_up, spr_predude_right]
alt_anims = anims

active = false
cur_anim = idle_anim

base_image_speed = 11
image_speed = base_image_speed

paused = true

// shader shits
shad_targ = shader_get_uniform(sh_prevcolorreplace, "targColor")
shad_rep = shader_get_uniform(sh_prevcolorreplace, "repColor")
shad_texsize = shader_get_uniform(sh_prevcolorreplace, "textureSize")

// prevent default draw code
image_alpha = 0