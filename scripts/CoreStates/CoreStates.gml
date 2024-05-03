function CoreStateInit() {}

function CoreStateCutscene() {

	CoreMove(CORE_MOVE_SPEED);
	CoreAim();

}

function CoreStateFree(){

	CoreMove(CORE_MOVE_SPEED);
	CoreAim();

	// Fire!
	if key.fire {
		CreateAttack(x, y, angle, global.attacks[global.atk_select].atk_obj);
	}
	
	// Focus!
	if key.focus {
		focus_release_timer = FOCUS_RELEASE_FRAMES;
		state = CoreStateFocus;
	}

}

function CoreStateFocus() {
	
	// Focus SFX
	if !audio_is_playing(sndFocusRing) {
		focus_sfx = audio_play_sound(sndFocusRing, 0, true);
		audio_sound_loop_start(focus_sfx, FOCUS_SFX_INTRO_POINT);
	}

    CoreMove(FOCUS_MOVE_SPEED);
	AimLock();
	
	var _old_atk_hover = atk_hover;
	if key.aim_held { hover_time++; }
	if key.aim_up {
		atk_hover = UP;
	} else if key.aim_left {
		atk_hover = LEFT;
	} else if key.aim_right {
		atk_hover = RIGHT;
	} else if !aim_lock {
		atk_hover = NONE;
		if atk_hover != _old_atk_hover { hover_time = 0; }
	}

	// Release focus
	if !key.focus {
		// Focus release: give a few frames of leeway to change attack after releasing focus.
		focus_release_timer--;
		
		// Only proceed with dropping focus if we pick an attack or run out of frame leeway
		if (atk_hover == NONE and focus_release_timer > 0) return;

		// Picked attack
		if atk_hover != NONE {
			global.atk_select = atk_hover;
			audio_play_sound(sndAtkShift, 0, false);
		}
        aim_lock = true;
        aim_reset_timer = AIM_LOCK_FRAMES;
        atk_hover = NONE;
        hover_time = 0;
		audio_stop_sound(focus_sfx);
		state = CoreStateFree;
	}
}

function CoreStateBreak() {

	CoreMove(CORE_MOVE_SPEED);
	CoreAim();
	button_hover = AimHover(angle, button_angles, false);
	if (button_hover != NONE) {
		angle = button_angles[button_hover];
	} else {
		angle = 90;
	}

	// Selecting buttons
	if keyboard_check_pressed(KEY_INTERACT) and (button_hover != NONE) {
		audio_play_sound(sndMenuSelect, 0, false);
		// TODO: implement buttons
		with (global.battle_engine) { BattleEngineShiftToWave(); }
	}
}