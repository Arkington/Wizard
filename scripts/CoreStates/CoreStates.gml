function CoreStateFree(){

	// Aiming
	CoreAim();
	
    // Movement
	CoreMove(CORE_MOVE_SPEED);
	
	// Fire!
	if key.fire {
		CreateAttack(x, y, angle, attacks[atk_select].atk_obj);
	}
	
	// Focus!
	if key.focus {
		time_in_state = 0;
		state = CoreStateFocus;
	}

}

function CoreStateFocus() {
	
	// Focus SFX
	if !audio_is_playing(sFocusRing) {
		focus_sfx = audio_play_sound(sFocusRing, 0, true);
	} else {
		var _sfx_pos = audio_sound_get_track_position(focus_sfx);
		if (_sfx_pos > FOCUS_SFX_INTRO_LEN + FOCUS_SFX_LOOP_LEN) {
			audio_sound_set_track_position(focus_sfx, _sfx_pos - FOCUS_SFX_LOOP_LEN);
		}
	}
	
	// Movement
    CoreMove(FOCUS_MOVE_SPEED);
	
	// TODO: Replace with CoreAim()
	
	// Aim lock - allows players to release selected attack briefly before releasing FOCUS_KEY
    aim_reset_timer--;
    if key.aim_released {
        aim_lock = true;
        aim_reset_timer = AIM_LOCK_FRAMES_FOCUS;
    }
    if aim_reset_timer < 0 { aim_lock = false; }
	
	// Attack hover
	var _old_atk_hover = atk_hover;
	if key.aim_up {
		atk_hover = UP;
		hover_time++;
	} else if key.aim_left {
		atk_hover = LEFT;
		hover_time++;
	} else if key.aim_right {
		atk_hover = RIGHT;
		hover_time++;
	} else if !aim_lock {
		atk_hover = NONE;
		if atk_hover != _old_atk_hover { hover_time = 0; }
	} else {
		hover_time++;
	}
	
	// Release focus
	if !key.focus {
		// Picked attack
		if atk_hover != NONE {
			atk_select = atk_hover;
			audio_play_sound(sAtkShift, 0, false);
		}
        aim_lock = true;
        aim_reset_timer = AIM_LOCK_FRAMES;
        atk_hover = NONE;
        hover_time = 0;
		time_in_state = 0;
		audio_stop_sound(focus_sfx);
		state = CoreStateFree;
	}
}