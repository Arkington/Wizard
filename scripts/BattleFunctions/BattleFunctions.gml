/// @desc Creates Battle() structs.
function Battle(_opponent, _background, _music, _wave_goal, _next_wave, _next_event, _final_event, _death_event) {
	return {
		opponent: _opponent,
		background: _background,
		music: _music,
		wave_goal : _wave_goal,
		NextWave : _next_wave,
		NextEvent : _next_event,
		FinalEvent: _final_event,
		DeathEvent: _death_event
	}
}

/// @desc Loads a Battle() struct into the BattleEngine.
function LoadBattle(_battle_struct_name) {
	with (global.battle_engine) {
		var _battle_struct = variable_global_get(_battle_struct_name);
		battle_struct_name = _battle_struct_name;
		battle_struct = _battle_struct;
		background = instance_create_layer(0, 0, LAYER_BATTLE_BACKGROUND, _battle_struct.background);
		music = _battle_struct.music;
		NextWave = _battle_struct.NextWave;
		NextEvent = _battle_struct.NextEvent;
		FinalEvent = _battle_struct.FinalEvent;
		DeathEvent = _battle_struct.DeathEvent;
		wave_goal = _battle_struct.wave_goal;
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

/// @desc Reset the Battle Engine to factory settings. Keep any variables in _to_keep unchanged.
function BattleEngineReset(_vars_to_keep = []) {
	
	// Store variables to keep
	var _to_keep = {};
	for (var i = 0; i < array_length(_vars_to_keep); i++) {
		struct_set(_to_keep, _vars_to_keep[i], variable_instance_get(global.battle_engine, _vars_to_keep[i]));
	}
	
	with (global.battle_engine) { init(); }
	
	// Re-load deleted variables
	for (var i = 0; i < array_length(_vars_to_keep); i++) {
		variable_instance_set(global.battle_engine, _vars_to_keep[i], struct_get(_to_keep, _vars_to_keep[i]));
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
			center_text : true,
			x_buffer: 0,
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

function HideOpponent() {
	with (pOpponent) {
		hidden = true;
		hittable = false;
	}
}
function ShowOpponent() {
	with (pOpponent) {
		hidden = false;
		hittable = true;
	}
}


/// @desc Resets an Enemy to factory settings.
function ResetEnemy(_enemy) {
	with (_enemy) {
		vel_x = 0;
		vel_y = 0;
		acc_x = 0;
		acc_y = 0;
		p_x = 0;
		p_y = 0;
		target_speed = 0;
	}
}

/// @desc Returns an array of all non-dead enemies.
function GetActiveEnemies() {
	var _enemies = [];
	var _n_enemies = instance_number(pEnemy);
	for (var i = 0; i < _n_enemies; i++) {
		var _enemy = instance_find(pEnemy, i);
		if (!_enemy.dead) { array_push(_enemies, _enemy); }
	}
	return _enemies;
}

/// @desc Stop everything in a battle from moving
function HaltBattle() {
	with (oBattleEngine) {
		state = BattleEngineStateDead;
	}
	with (pWave) {
		halted = true; // Halts step function
	}
	ResetEnemy(pEnemy);
	with (pBullet) {
		speed = 0;
	}
	with (pAttack) {
		speed = 0;
	}
}

/// @desc Standard battle transition
function EnterBattle(_battle_struct_name) {
	EventPlayerStateCutscene();
	BattleEngineStorePlayerPosition();
	EventJump(oPlayer);
	WaitForEvents();
	EventSound(sndAtkShift);
	EventCoreInit(CORE_INIT_X, CORE_INIT_Y);
	EventTransition(rParent);
	WaitForEvents();
	EventSound(sndAtkShift);
	EventWait(1);
	EventTransition(rBattleParent);
	WaitForEvents();
	EventCoreState(CoreStateFree);
	EventCode(function() { oCore.persistent = false; });
	EventCode(LoadBattle, [_battle_struct_name]);
}

/// @desc Exits a battle to the overworld using the Battle Engine's stored player info, then resets the engine.
function ExitBattle() {
	EventTransition(
		global.battle_engine.room_prev,
		global.battle_engine.x_prev,
		global.battle_engine.y_prev,
		global.battle_engine.face_prev
	);
	WaitForEvents();
	EventCode(BattleEngineReset);
	EventPlayerStateFree(); // TODO: maybe script an event immediately following a battle...
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
	with (global.battle_engine) { DeathEvent(); } // Run the death event for the battle
	WaitForEvents();
	EventPlayMusic(musItsOkayToMakeMistakes);
	EventCreate(MID_X, GAME_OVER_Y, LAYER_INSTANCES, oRetryMenu);
}

/// @desc Sequence triggered after clicking retry
function RetrySequence() {
	var _battle_struct_name = global.battle_engine.battle_struct_name;
	BattleEngineReset(["room_prev", "x_prev", "y_prev", "face_prev"]);
	
	EventStopMusic(true, 1.5);
	WaitForEvents();
	EventCoreRetry(CORE_INIT_X, CORE_INIT_Y); // Handles the animation until the hat lands in the ring
	WaitForEvents();
	EventSound(sndAtkShift);
	EventWait(1);
	EventTransition(rBattleParent);
	WaitForEvents();
	EventCoreState(CoreStateFree);
	EventCode(function() { oCore.persistent = false; });
	EventCode(LoadBattle, [_battle_struct_name]);
}

function QuitSequence() {
	EventStopMusic(true, 1.5)
	WaitForEvents();
	EventWait(1);
	EventCode(game_end);
}


/// @desc Check if an object is in battle view, ie in (0,0) to (RESOLUTION_W, RESOLUTION_H).
function IsInBattleView(_obj) {
	var _x0 = _obj.x - sprite_get_xoffset(_obj.sprite_index);
	var _y0 = _obj.y - sprite_get_yoffset(_obj.sprite_index);
	var _w = sprite_get_width(_obj.sprite_width);
	var _h = sprite_get_height(_obj.sprite_height);
	
	var _to_check = [
		[_x0, _y0],
		[_x0 + _w, _y0],
		[_x0, _y0 + _h],
		[_x0 + _w, _y0 + _h],
	]
	for (var i = 0; i < 4; i++) {
		if point_in_rectangle(
			_to_check[i][0],
			_to_check[i][1],
			0,
			0,
			RESOLUTION_W,
			RESOLUTION_H
		) { return true; }
	}
	return false;
}