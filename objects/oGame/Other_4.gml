/// @desc Wall vis, double players
layer_set_visible(LAYER_WALLS, global.debug);

// Destroy all players but one
for (var i = 1; i < instance_number(oPlayer); i++) {
    instance_destroy(instance_find(oPlayer, i));
}