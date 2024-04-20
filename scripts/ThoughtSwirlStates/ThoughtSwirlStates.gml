/// @desc Thought Swirl state machine

function ThoughtSwirlStateWaiting() {
	// Waiting for thoughts to manifest
	if (lifetime > secs_until_appear*fps) {
		state = ThoughtSwirlStateActive;
	}
}

function ThoughtSwirlStateActive() {
	
	// Read player aim
	key.aim_up = keyboard_check(KEY_AIM_UP);
	key.aim_left = keyboard_check(KEY_AIM_LEFT);
	key.aim_down = keyboard_check(KEY_AIM_DOWN);
	key.aim_right = keyboard_check(KEY_AIM_RIGHT);
	key.aim_held = key.aim_up or key.aim_left or key.aim_right or key.aim_down;
	key.aim_released = (
	    keyboard_check_released(KEY_AIM_UP) or
	    keyboard_check_released(KEY_AIM_LEFT) or
	    keyboard_check_released(KEY_AIM_DOWN) or
	    keyboard_check_released(KEY_AIM_RIGHT)
	);
	
	// Fade in
	alpha = min(1, alpha + THOUGHT_FADE_SPEED);

	// Aim at a thought
	CoreAim();
	if key.aim_held {
		var shortest_angle_distance = 360;
		for (var i = 0; i < n_thoughts; i++) {
			var dist = abs(angle_difference(angle, thought_angles[i]));
			if (dist < shortest_angle_distance) {
				shortest_angle_distance = dist;
				hover_thought = i;
			}
		}
	}
	else {
		hover_thought = NONE;
	}

	// Resizing thoughts based on hover
	for (var i = 0; i < n_thoughts; i++) {
		if (i == hover_thought) {
			thought_scales[i] = min(THOUGHT_TEXT_SCALE*HOVER_THOUGHT_SCALE, thought_scales[i]*(1 + HOVER_THOUGHT_SPEED));
		} else {
			thought_scales[i] = max(THOUGHT_TEXT_SCALE, thought_scales[i]*(1 - HOVER_THOUGHT_SPEED));
		}
		thought_textboxes[i].scale = thought_scales[i];
	}

	// Selecting thoughts
	if keyboard_check_pressed(KEY_INTERACT) and (hover_thought != NONE) {
		state = ThoughtSwirlStateFading;
		load_text(thought_swirl_name, thoughts[hover_thought]);
	}
}

function ThoughtSwirlStateFading() {
	// Fade thoughts out
	alpha = min(1, alpha - 2*THOUGHT_FADE_SPEED);
	if (alpha <= 0) {	instance_destroy(); }
}