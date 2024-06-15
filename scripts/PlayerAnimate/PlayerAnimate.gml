/// @desc Animate the player based on movement and direction. Requires: local_frame, x_speed, y_speed.

if (live_call()) return live_result;

function PlayerAnimate() {

	// When stopped
    if x_speed == 0 && y_speed == 0 {
		sprite_index = sPlayerIdle;
    	local_frame = 0;
    } else {
		sprite_index = sPlayerWalk;
	}

	// Update Sprite
	var _frames_per_dir = sprite_get_number(sprite_index) / 4;
	image_index = local_frame + (CARDINAL_DIR * _frames_per_dir);
	local_frame += sprite_get_speed(sprite_index) / FPS;

	// If animation would loop on next game step
	if (local_frame >= _frames_per_dir) {
		local_frame -= _frames_per_dir;
	}
}