/// @desc
if !active { exit; }

// Begin animation when active
if !begun {
	obj_to_animate.sprite_index = sprite;
	obj_to_animate.image_index = start_frame;
	obj_to_animate.image_speed = 1;
	begun = true;
}

// When the object completes an animation, increment
var _next_frame = obj_to_animate.image_index + sprite_speed/fps;

if (_next_frame >= min(end_frame, sprite_number)) {
	n_plays_so_far++;
	// All iterations played
	if (n_plays_so_far >= n_plays) {
		// Decide what happens next
		switch (after_animation) {
			case AFTER_ANIMATION.BACK_TO_OLD_SPRITE:
				obj_to_animate.sprite_index = prev_sprite;
				break;
			case AFTER_ANIMATION.FREEZE_SPRITE:
				obj_to_animate.image_speed = 0;
				break;
			case AFTER_ANIMATION.LEAVE_NEW_SPRITE:
				break;
		}
		complete = true;
	} else {
		obj_to_animate.image_index = start_frame;
	}
}