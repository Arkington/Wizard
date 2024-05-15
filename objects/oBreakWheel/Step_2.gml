/// @desc Move after BulletBox
t++;


// Hover over button
var _button_angle = Aim();
var _old_button_hover = button_hover;
if (_button_angle != NONE) {
	button_hover = NearestAngle(_button_angle, button_angles);
	oCore.angle = button_angles[button_hover];
}
if (button_hover != _old_button_hover) {
	hover_time = 0;
} else {
	hover_time++;
}
	
// Resizing based on hover
for (var i = 0; i < n_buttons; i++) {
	if (i == button_hover) {
		button_scales[i] = min(BREAK_BUTTON_HOVER_SCALE, button_scales[i]*(1 + BREAK_BUTTON_HOVER_SPEED));
	} else {
		button_scales[i] = max(1, button_scales[i]*(1 - BREAK_BUTTON_HOVER_SPEED));
	}
}

// Update textboxes
for (var i = 0; i < n_buttons; i++) {
	button_textboxes[i].scale = button_scales[i]*BREAK_BUTTON_TEXT_SCALE;
	button_textboxes[i].screenpos_x =  oCore.x + lengthdir_x(BREAK_BUTTON_RADIUS, button_angles[i]) - button_scales[i]*BREAK_BUTTON_WIDTH/2;
	button_textboxes[i].screenpos_y =  oCore.y + lengthdir_y(BREAK_BUTTON_RADIUS, button_angles[i]) - button_scales[i]*BREAK_BUTTON_HEIGHT/2;
}


// Selecting buttons
if keyboard_check_pressed(KEY_INTERACT) and (button_hover != NONE) {
	audio_play_sound(sndMenuSelect, 0, false);
	with (oCore) { state = CoreStateCutscene; }
	switch (buttons[button_hover]) {
		case BUTTON_THINK:
			EventText("textTemp", "think");
			WaitForEvents();
			EventCode(BattleEngineShiftToWave);
			break;
		case BUTTON_ITEM:
			EventText("textTemp", "item");
			WaitForEvents();
			EventCode(BattleEngineShiftToWave);
			break;
		case BUTTON_READY:
			BattleEngineShiftToWave();
			break;
		case BUTTON_READY_X:
			BattleEngineShiftToFinalAttack();
			break;
	}
	instance_destroy();
}