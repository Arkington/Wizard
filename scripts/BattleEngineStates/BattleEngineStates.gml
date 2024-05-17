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

// CuTSCENE STATE (also initial state)
function BattleEngineShiftToCutscene() {
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
	with (oBattleEngine) {
		state = BattleEngineStateBreak;
		break_wheel = CreateBreakWheel(buttons, victory);
	}
	CoreShiftToBreak();
}

function BattleEngineStateBreak() {}


// WAVE STATE
function BattleEngineShiftToWave() {
	// Set up for next wave
	with (oBattleEngine) {
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
		n_wins++;
		last_wave_win = true;
		array_push(waves_cleared, current_wave.object_index);
	}
	// Lose
	else {
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

/// @desc In the Wave-Cooloff phase, all Attacks and Bullets are deleted/disabled
function BattleEngineShiftToWaveCooloff() {
	with (oBattleEngine) {
		instance_destroy(pAttack);
		instance_destroy(pBullet);
		state = BattleEngineStateWaveCooloff;
	}
	with (oCore) { state = CoreStateCutscene; }
}

function BattleEngineStateWaveCooloff() {
	
	// Remove enemies
	if (time_in_state % COOLOFF_FRAMES_BETWEEN_CLEAR == 0) {
		// Pick an enemy and remove it, granting no kill
		var _enemy = instance_find(pEnemy, irandom(instance_number(pEnemy) - 1));
		if (_enemy != noone) {
			ReportEnemyDown(_enemy, false);
			instance_destroy(_enemy);
			audio_play_sound(sndPop, 0, false);
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
	with (oBattleEngine) {
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
function BattleEngineStateEnd() {}



// DEATH
function BattleEngineShiftToDeath() {
	instance_destroy(pWave);
}

function BattleEngineStateAwaitDeathAnimation() {}