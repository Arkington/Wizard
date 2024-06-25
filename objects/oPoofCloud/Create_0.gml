/// @desc
t = 0;
poof_time_s = 0.5;
drift_x = 8;
drift_y = 20;

min_poofs = 8;
max_poofs = 12;

min_scale = 0.5;
max_scale = 1.8;

var_x = 10;
var_y = 10;


// Create poofs
poofs = [];
poofs_x = [];
poofs_y = [];
poofs_scale = [];
n_poofs = irandom_range(min_poofs, max_poofs);
for (var i = 0; i < n_poofs; i++;) {
	poofs[i] = instance_create_layer(x, y, LAYER_INSTANCES, oPoof);
	// Randomise poof spriting
	poofs[i].image_index = random(poofs[i].image_number);
	poofs_x[i] = rnorm(0, var_x);
	poofs_y[i] = rnorm(0, var_y);
	poofs_scale[i] = random_range(min_scale, max_scale);
}

// SFX
audio_play_sound(sndPopIn, 0, false);