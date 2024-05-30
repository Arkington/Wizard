/// @desc Battle Engine State Machine





// AWAITING STATE
function BattleEngineStateAwaiting() {
	if (battle_struct != NONE) {
		bullet_box = instance_create_layer(BB_X, BB_Y, LAYER_BATTLE_GUI, oBulletBox);
		hp_bar = instance_create_layer(HP_X, HP_Y, LAYER_BATTLE_GUI, oHP);
		attack_ui = instance_create_layer(0, 0, LAYER_BATTLE_GUI, oAttackUI);
		meter = instance_create_layer(METER_X, METER_Y, LAYER_BATTLE_GUI, oMeter);
		opponent = instance_create_layer(0, 0, LAYER_BATTLE_GUI, battle_struct.opponent);
		BattleEngineShiftToCutscene();
	}
}

// CUTSCENE STATE (also initial state)
function BattleEngineShiftToCutscene() {
	ShowOpponent();
	with (global.battle_engine) {
		SetBulletBox(BB_X, BB_Y, BB_W, BB_H);
		state = BattleEngineStateCutscene;
		NextEvent();
	}
	with (oCore) { state = CoreStateCutscene; }
}

function BattleEngineStateCutscene() {
	if (EventQtyRemaining() == 0) {
		BattleEngineShiftToBreak();
	}
}

// BREAK STATE
function BattleEngineShiftToBreak() {
	ShowOpponent();
	with (global.battle_engine) {
		state = BattleEngineStateBreak;
		break_wheel = CreateBreakWheel(buttons, victory);
	}
	CoreShiftToBreak();
}

function BattleEngineStateBreak() {}


// WAVE STATE
function BattleEngineShiftToWave() {
	HideOpponent();
	// Set up for next wave
	with (global.battle_engine) {
		current_wave = instance_create_layer(0, 0, LAYER_MECHANICS, NextWave());
		get_em = CreateGetEm(current_wave);
		state = BattleEngineStateWave;
	}
	with (oCore) {
		state = CoreStateFree;
		angle = 90;
	}
}

function BattleEngineStateWave() {
	
	if !current_wave.over { return; }
	
	// Win
	if (current_wave.clear) {
		audio_play_sound(sndWaveWin, 0, false);
		n_wins++;
		last_wave_win = true;
		array_push(waves_cleared, current_wave.object_index);
	}
	// Lose
	else {
		audio_play_sound(sndWaveFail, 0, false);
		n_fails++;
		last_wave_win = false;
		array_push(waves_failed, current_wave.object_index);
	}
	
	// Report progress
	meter.progress = n_wins/wave_goal;
	if (n_wins >= wave_goal) {
		victory = true;
	}
	n_waves++;
	last_wave = current_wave.object_index;
	
	// Move to Cooloff
	BattleEngineShiftToWaveCooloff();
}


// WAVE COOLOFF STATE

/// @desc In the Wave-Cooloff phase, Bullets are deleted/disabled
function BattleEngineShiftToWaveCooloff() {
	with (pBullet) { fizzle = true; }

	with (global.battle_engine) {
		state = BattleEngineStateWaveCooloff;
	}
	
	// Kill offscreen enemies
	with (pEnemy) {
		if (!IsInBattleView(self)) {
			ReportEnemyDown(id, false);
			instance_destroy();
		}
	}
}

function BattleEngineStateWaveCooloff() {
	
	// Remove enemies
	if (time_in_state % COOLOFF_FRAMES_BETWEEN_CLEAR == 0) {
		
		var _enemies = GetActiveEnemies();
		var _n_enemies = array_length(_enemies);
		if (_n_enemies > 0) {
			
			// Pick an enemy and remove it, granting no kill
			_enemy = _enemies[irandom(_n_enemies - 1)];
			ReportEnemyDown(_enemy.id, false);
			
			// Vary behaviour based on wave success
			if (current_wave.clear) {
				audio_play_sound(sndPop, 0, false);
				_enemy.state = _enemy.StateDying;
			} else {
				audio_play_sound(sndEnemyWarp, 0, false);
				_enemy.state = _enemy.StateWarping;
			}
		}
	}

	// Finish if all enemies are destroyed and some delay has passed
	if (instance_number(pEnemy) == 0) and (time_in_state > COOLOFF_MIN_TIME_S*FPS) {	

		// Final cleanup
		instance_destroy(get_em);
		instance_destroy(current_wave);
		instance_destroy(pBattleObject);
		current_wave = NONE;

		// Go to the next state
		BattleEngineShiftToCutscene();
	}
}



// FINAL ATTACK and END STATES
function BattleEngineShiftToFinalAttack() {
	ShowOpponent();
	with (global.battle_engine) {
		state = BattleEngineStateFinalAttackStart;
	}
	with (oCore) { state = CoreStateFinalAttack; }
}
function BattleEngineStateFinalAttackStart() {
	StopMusic(true, 1);
	// Wait for the final attack to start
	if instance_exists(pAttack) {
		state = BattleEngineStateFinalAttackEnd;
	}
}
function BattleEngineStateFinalAttackEnd() {
	// Wait for final attack to end
	if !instance_exists(pAttack) {
		FinalEvent();
		state = BattleEngineStateEnd;
	}
}
function BattleEngineStateEnd() {
	if (room != rBattleParent) {
		BattleEngineReset();
	}
}



// DEAD
function BattleEngineStateDead() {}