/// @desc Fire SFX
audio_play_sound(fire_sfx, 0, false);

// Default on-hit function
on_hit = function(_enemy) {
	instance_destroy();
};

// Default post-create function.
// This allows us to use any variables assigned in CreateAttack().
post_create = function() {}