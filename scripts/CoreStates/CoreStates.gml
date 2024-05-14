function CoreStateInit() {}

function CoreStateCutscene() {

	CoreMove(CORE_MOVE_SPEED);
	CoreAim();

}

function CoreStateFree() {

	CoreMove(CORE_MOVE_SPEED);
	CoreAim();

	// Fire!
	if key.fire {
		if (cooldowns[attack_select] <= 0) {
			CreateAttack(x, y, angle, attacks[attack_select].attack_obj);
			cooldowns[attack_select] = attacks[attack_select].cooldown;
		} else {
			audio_play_sound(sndEmptyAttack, 0, false);
		}
	}
	
	// Focus!
	if key.focus {
		attack_release_timer = 0;
		focus_release_timer = FOCUS_RELEASE_FRAMES;
		state = CoreStateFocus;
	}

}

function CoreStateFocus() {
	
	// Focus SFX
	if !audio_is_playing(sndFocusRing) {
		focus_sfx = audio_play_sound(sndFocusRing, 0, true);
	}

    CoreMove(FOCUS_MOVE_SPEED);

	// Hover over attack, including Aim-Lock and Attack-Release leeway
	var _focus_angle = Aim();
	var _old_attack_hover = attack_hover;
	if (_focus_angle != NONE) {
		attack_hover = NearestAngle(_focus_angle, attack_angles);
		attack_release_timer = ATTACK_RELEASE_FRAMES;
	} else if (attack_release_timer <= 0) {
		// Give a few frames leeway to drop attack
		attack_hover = NONE;
	} else {
		attack_release_timer--;
	}
	if (attack_hover != _old_attack_hover) {
		hover_time = 0;
	} else {
		hover_time++;
	}

	// Resizing based on hover
	for (var i = 0; i < n_attacks; i++) {
		if (i == attack_hover) {
			attack_scales[i] = min(HOVER_ATTACK_SCALE, attack_scales[i]*(1 + HOVER_ATTACK_SPEED));
		} else {
			attack_scales[i] = max(1, attack_scales[i]*(1 - HOVER_ATTACK_SPEED));
		}
	}

	// Release focus
	if !key.focus {
		// Focus release: give a few frames of leeway to change attack after releasing focus.
		focus_release_timer--;
		
		// Only proceed with dropping focus if we pick an attack or run out of frame leeway
		if (attack_hover == NONE and focus_release_timer > 0) return;

		// Picked attack
		if attack_hover != NONE {
			attack_select = attack_hover;
			audio_play_sound(sndAtkShift, 0, false);
		}
        aim_lock = true;
        aim_reset_timer = AIM_LOCK_FRAMES;
        attack_hover = NONE;
        hover_time = 0;
		audio_stop_sound(focus_sfx);
		state = CoreStateFree;
	}
}

function CoreShiftToBreak() {
	with (oCore) {
		button_hover = NONE;
		angle = 90;
		state = CoreStateBreak;
	}
}


function CoreStateBreak() {

	CoreMove(CORE_MOVE_SPEED);
	
	// Hover over button
	var _button_angle = Aim();
	var _old_button_hover = button_hover;
	if (_button_angle != NONE) {
		button_hover = NearestAngle(_button_angle, button_angles);
		angle = button_angles[button_hover];
	}
	if (button_hover != _old_button_hover) {
		hover_time = 0;
	} else {
		hover_time++;
	}
	
	// Resizing based on hover
	for (var i = 0; i < n_buttons; i++) {
		if (i == button_hover) {
			button_scales[i] = min(HOVER_BUTTON_SCALE, button_scales[i]*(1 + HOVER_BUTTON_SPEED));
		} else {
			button_scales[i] = max(1, button_scales[i]*(1 - HOVER_BUTTON_SPEED));
		}
	}

	// Selecting buttons
	if keyboard_check_pressed(KEY_INTERACT) and (button_hover != NONE) {
		audio_play_sound(sndMenuSelect, 0, false);
		angle = 90;
		state = CoreStateCutscene;
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
				if (powered_up) {
					BattleEngineShiftToFinalAttack();
				} else {
					BattleEngineShiftToWave();
				}
				break;
		}
	}
}

function CoreStateFinalAttack() {
	angle = 90;
	CoreMove(CORE_MOVE_SPEED);
	if key.fire {
		CreateAttack(x, y, angle, attacks[attack_select].final_attack_obj);
		state = CoreStateFinalAttackFiring;
	}
}

function CoreStateFinalAttackFiring() {
	CoreMove(CORE_MOVE_SPEED);
}



textTemp = {
	think: [
		Page(spkAxel, $"I'm doing some thinking!", BATTLE_TEXT_LEFT),
	],
	item: [
		Page(spkAxel, $"This is where I would pull out an item if that was implemented.", BATTLE_TEXT_LEFT),
	]
}