/// @desc Creates Battle() structs.
function Battle(_opponent, _music, _wave_goal, _next_wave, _next_event, _final_event) {
	return {
		opponent: _opponent,
		music: _music,
		wave_goal : _wave_goal,
		NextWave : _next_wave,
		NextEvent : _next_event,
		FinalEvent: _final_event,
	}
}

/// @desc Allows the BattleEngine to track the player's overworld position prior to battle
function BattleEngineStorePlayerPosition() {
	if (instance_exists(oPlayer)) {
		with (global.battle_engine) {
			room_prev = room;
			x_prev = oPlayer.x;
			y_prev = oPlayer.y;
			face_prev = cardinal_dir(oPlayer.direction);
		}
	} else {
		show_debug_message("Player is not in room, cannot store position prior to battle.");
	}
}

/// @desc Loads a Battle() struct into the BattleEngine.
function LoadBattle(_battle_struct_name) {
	with (global.battle_engine) {
		var _battle_struct = variable_global_get(_battle_struct_name);
		battle_struct = _battle_struct;
		music = _battle_struct.music;
		NextWave = _battle_struct.NextWave;
		NextEvent = _battle_struct.NextEvent;
		FinalEvent = _battle_struct.FinalEvent;
		wave_goal = _battle_struct.wave_goal;
	}
}

/// @desc Resets the BattleEngine to await a new battle.
function EndBattle() {
	with(global.battle_engine) {
		battle_struct = NONE;
		state = BattleEngineStateAwaiting;
	}
}

/// @desc Set image_alpha for BulletBox, HP bar, AttackUI and Meter
function BattleGUIAlpha(_alpha) {
	with global.battle_engine {
		bullet_box.image_alpha = _alpha;
		hp_bar.image_alpha = _alpha;
		attack_ui.image_alpha = _alpha;
		meter.image_alpha = _alpha;
	}
}

/// @desc Create a Get Em board by giving it a wave
function CreateGetEm(_wave) {
	var _get_em = instance_create_layer(_wave.get_em_x, _wave.get_em_y, LAYER_BATTLE_GUI, oGetEm);
	with (_get_em) {
		wave = _wave;
		var _enemies = variable_struct_get_names(wave.clear_condition);
		enemy_qty = struct_get(wave.clear_condition_progress, _enemies[0]);
		enemy_sprite = object_get_sprite(asset_get_index(_enemies[0]));
	}
	return _get_em;
}

/// @desc Reports the defeat of an enemy to the active wave. Optionally choose not to grant the kill to the player.
function ReportEnemyDown(_enemy_id, _grant_kill = true) {
	var _enemy_name = object_get_name(_enemy_id.object_index);
	
	with global.battle_engine {
		
		// Update clear condition
		if (_grant_kill and array_contains(struct_get_names(current_wave.clear_condition_progress), _enemy_name)) {
			var _enemies_remaining = max(struct_get(current_wave.clear_condition_progress, _enemy_name) - 1, 0);
			struct_set(current_wave.clear_condition_progress, _enemy_name, _enemies_remaining);
		}
		
		// Replace enemy with ENEMY_DOWN
		for (var i = 0; i < array_length(current_wave.enemies); i++) {
			if (current_wave.enemies[i] == _enemy_id) {
				array_delete(current_wave.enemies, i, 1);
				array_insert(current_wave.enemies, i, ENEMY_DOWN);
				break;
			}
		}
	}
}

/// @desc Changes the bullet box orientation
function SetBulletBox(_x, _y, _w, _h) {
	with global.battle_engine {
		bullet_box.target_x = _x;
		bullet_box.target_y = _y;
		bullet_box.target_w = _w;
		bullet_box.target_h = _h;
	}
}


/// @desc Creates a Break Wheel's textbox. Used in CreateBreakWheel().
function CreateBreakButtonTextbox(_button) {
    return CreateTextbox(Page(
		Speaker(NO_PORTRAIT, NO_VOICE),
		_button,
		{
			textbox_sprite : sBreakButton,
			textbox_font : fntText,
			textbox_width : BREAK_BUTTON_WIDTH/BREAK_BUTTON_TEXT_SCALE,
			textbox_height : BREAK_BUTTON_HEIGHT/BREAK_BUTTON_TEXT_SCALE,
			scale : BREAK_BUTTON_TEXT_SCALE,
		}
	));
}


/// @desc Creates a Break Wheel with specified buttons
function CreateBreakWheel(_buttons, _victory) {
	instance_create_layer(0, 0, LAYER_INSTANCES, oBreakWheel);
	with (oBreakWheel) {
		buttons = _buttons;
		victory = _victory;
		n_buttons = array_length(buttons);
		for (var i = 0; i < n_buttons; i++) {
			// Victorious Ready
			if (buttons[i] == BUTTON_READY and victory) { buttons[i] = BUTTON_GET_EM; }
			button_angles[i] = 270 + 360*i/n_buttons;
			button_scales[i] = 1;
			button_textboxes[i] = CreateBreakButtonTextbox(buttons[i])
		}
	}
}

/// @desc Stop everything in a battle from moving
function HaltBattle() {
	with (oBattleEngine) {
		state = BattleEngineStateAwaitDeathAnimation;
	}
	with (pWave) {
		halted = true; // Halts step function
	}
	with (pEnemy) {
		vel_x = 0;
		vel_y = 0;
		acc_x = 0;
		acc_y = 0;
		p_x = 0;
		p_y = 0;
		target_speed = 0;
	}
	with (pBullet) {
		speed = 0;
	}
	with (pAttack) {
		speed = 0;
	}
}

/// @desc Sequence triggered on player death in battle.
function DeathSequence() {
	HaltBattle();
	with (oCore) {
		persistent = true;
		state = CoreStateDead;
	}
	EventStopMusic(false);
	EventShakeCamera(4, 0.2);
	EventWait(1);
	EventTransition(rDead);
	EventCoreDeath(); // This thing handles flying backwards and falling to the ground
	WaitForEvents();
	EventWait(1);
	EventPlayMusic(musItsOkayToMakeMistakes);
	EventCreate(MID_X, GAME_OVER_Y, LAYER_INSTANCES, oRetryMenu);
}