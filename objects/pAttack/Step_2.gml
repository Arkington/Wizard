/// @desc Kill an Out-Of-Bounds Attack
if (
	(x < -sprite_width - OOB_KILL_DIST) or
	(x > sprite_width + RESOLUTION_W + OOB_KILL_DIST) or
	(y < sprite_height - OOB_KILL_DIST) or
	(y > sprite_height + RESOLUTION_H + OOB_KILL_DIST)
) {
	instance_destroy();
}