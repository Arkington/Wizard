if (instance_number(oPlayer) > 1) { instance_destroy(); }
state = PlayerStateFree;

collision_map = layer_tilemap_get_id(layer_get_id(LAYER_WALLS));
local_frame = 0;
x_speed = 0;
y_speed = 0;
depth_adj = 0;
key = {};
