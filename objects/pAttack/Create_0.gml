/// @desc Fire SFX
audio_play_sound(fire_sfx, 0, false);

// Default on-hit function
on_hit = function(_enemy) {
	instance_destroy();
};