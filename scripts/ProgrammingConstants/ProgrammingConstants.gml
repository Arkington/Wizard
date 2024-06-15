#macro NONE undefined
#macro EPSILON 0.00001
#macro LARGE 99999

#macro LAST_FRAME sprite_get_number(sprite_index) - 1
#macro OBJ_MID_X x - image_xscale*sprite_get_xoffset(sprite_index) + sprite_width/2
#macro OBJ_MID_Y y - image_yscale*sprite_get_yoffset(sprite_index) + sprite_height/2