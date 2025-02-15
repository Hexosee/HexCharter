themes = load_theme_list()

array_insert(themes, 0, ["Back",""])
array_insert(themes, 1, ["",""])

curr_theme = noone

targ_back_col = obj_persistent.col_overlay
targ_fore_col = obj_persistent.col_grid2

curr_back_col = targ_back_col
curr_fore_col = targ_fore_col

curr_alpha_lerp = 1

sel = 0