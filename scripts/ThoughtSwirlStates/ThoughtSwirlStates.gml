/// @desc Thought Swirl state machine
function ThoughtSwirlStateWaiting() {
	// Waiting for thoughts to manifest
	if (lifetime > secs_until_appear*fps) {
		state = ThoughtSwirlStateActive;
	}
}

function ThoughtSwirlStateActive() {
	
	// Fade in
	alpha = min(1, alpha + THOUGHT_FADE_SPEED);

	// Aim at a thought
	angle = Aim();
	if (angle != NONE) {
		hover_thought = NearestAngle(angle, thought_angles);
	} else {
		hover_thought = NONE;
	}

	// Resizing thoughts based on hover
	for (var i = 0; i < n_thoughts; i++) {
		if (i == hover_thought) {
			thought_scales[i] = min(HOVER_THOUGHT_SCALE, thought_scales[i]*(1 + HOVER_THOUGHT_SPEED));
		} else {
			thought_scales[i] = max(1, thought_scales[i]*(1 - HOVER_THOUGHT_SPEED));
		}
	}

	// Selecting thoughts
	if keyboard_check_pressed(KEY_INTERACT) and (hover_thought != NONE) {
		state = ThoughtSwirlStateFading;
		script_execute(actions[hover_thought]);
		thought_picked = hover_thought;
	}
}

function ThoughtSwirlStateFading() {
	// Fade thoughts out
	alpha = min(1, alpha - 2*THOUGHT_FADE_SPEED);
	if (alpha <= 0) { instance_destroy(); } // Textboxes destroyed in Destroy event
}