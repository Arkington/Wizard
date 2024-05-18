/// @desc
t = 0;
image_alpha = 0;
button_alpha = 0;
button_textboxes = [];
button_x = [MID_X - RETRY_BUTTON_DIST, MID_X + RETRY_BUTTON_DIST];
button_x_drift_seq = [[0], [0]];
button_y_drift_seq = [[0], [0]];
button_x_drift_noise = [[], []];
button_y_drift_noise = [[], []];
button_scales = [1, 1];

// State Machine
RetryMenuStateFadeIn = function() {
	image_alpha = min(image_alpha + 1/(GAME_OVER_FADE_IN_TIME*FPS), 1);
	if (t > GAME_OVER_TIME_TO_BUTTONS_S*FPS) {
		button_textboxes[0] = CreateBreakButtonTextbox("Retry");
		button_textboxes[1] = CreateBreakButtonTextbox("Do Not");
		n_buttons = array_length(button_textboxes);
		state = RetryMenuStateActive;
	}
}

RetryMenuStateActive = function() {

	// Fade in buttons	
	button_alpha = min(button_alpha + 1/(GAME_OVER_FADE_IN_TIME*FPS), 1);
	
	// Inputs
	var _left = keyboard_check(KEY_MOVE_LEFT) or keyboard_check(KEY_AIM_LEFT);
	var _right = keyboard_check(KEY_MOVE_RIGHT) or keyboard_check(KEY_AIM_RIGHT);
	var _select = keyboard_check(KEY_INTERACT);

	// Hover
	var _hover = NONE;
	if (_left and !_right) { _hover = 0; }
	if (_right and !_left) { _hover = 1; }
	
	// Resizing thoughts based on hover
	for (var i = 0; i < n_buttons; i++) {
		if (i == _hover) {
			button_scales[i] = min(RETRY_BUTTON_HOVER_SCALE, button_scales[i]*(1 + RETRY_BUTTON_HOVER_SPEED));
		} else {
			button_scales[i] = max(1, button_scales[i]*(1 - RETRY_BUTTON_HOVER_SPEED));
		}
	}
	
	
	// Update textboxes
	for (var i = 0; i < n_buttons; i++) {
		// Move every so often with an ARMA model
		if (t % RETRY_BUTTON_FRAME_DELAY == 0) {
			next_arma_value(button_x_drift_seq[i], button_x_drift_noise[i], RETRY_BUTTON_AR, RETRY_BUTTON_MA, RETRY_BUTTON_ARMA_VAR);
			next_arma_value(button_y_drift_seq[i], button_y_drift_noise[i], RETRY_BUTTON_AR, RETRY_BUTTON_MA, RETRY_BUTTON_ARMA_VAR);
		}
		button_textboxes[i].alpha = button_alpha;
		button_textboxes[i].scale = button_scales[i]*RETRY_BUTTON_TEXT_SCALE;
		button_textboxes[i].screenpos_x =  button_x[i] + array_last(button_x_drift_seq[i]) - button_scales[i]*RETRY_BUTTON_WIDTH/2;
		button_textboxes[i].screenpos_y =  RETRY_BUTTON_Y + array_last(button_y_drift_seq[i]) - button_scales[i]*BREAK_BUTTON_HEIGHT/2;
	}

	// Selecting buttons
	if (_select and _hover != NONE) {
		state = RetryMenuStateFadeOut;
		if (_hover == 0) { RetrySequence(); }
		else if (_hover == 1) { QuitSequence(); }
	}
}

RetryMenuStateFadeOut = function() {
	image_alpha -= 1/(GAME_OVER_FADE_IN_TIME*FPS);
	button_alpha -= 1/(GAME_OVER_FADE_IN_TIME*FPS);
	for (var i = 0; i < n_buttons; i++) {
		button_textboxes[i].alpha = button_alpha;
	}
	if (image_alpha <= 0) { instance_destroy(); }
}


state = RetryMenuStateFadeIn;