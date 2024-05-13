/// @desc Battle Engine State Machine




function BattleEngineStateEnd() {

}


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
	SetBulletBox(BB_X, BB_Y, BB_W, BB_H);
	with (oCore) { state = CoreStateCutscene; }
	state = BattleEngineStateCutscene;
	NextEvent();
}

function BattleEngineStateCutscene() {
	if (EventQtyRemaining() == 0) {
		BattleEngineShiftToBreak();
	}
}

// BREAK STATE
function BattleEngineShiftToBreak() {
	with (oCore) { state = CoreStateBreak; }
	state = BattleEngineStateBreak;
}

function BattleEngineStateBreak() {}


// WAVE STATE
function BattleEngineShiftToWave() {
	// Set up for next wave
	current_wave = instance_create_layer(0, 0, LAYER_MECHANICS, NextWave());
	get_em = CreateGetEm(current_wave);
	with (oCore) { state = CoreStateFree; }
	state = BattleEngineStateWave;
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
	n_waves++;
	last_wave = current_wave.object_index;
	
	// Move to Cooloff
	BattleEngineShiftToWaveCooloff();
}


// WAVE COOLOFF STATE

/// @desc In the Wave-Cooloff phase, all Attacks and Bullets are deleted/disabled
function BattleEngineShiftToWaveCooloff() {
	with (oCore) { state = CoreStateCutscene; }
	instance_destroy(pAttack);
	instance_destroy(pBullet);
	state = BattleEngineStateWaveCooloff;
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


// FINAL ATTACK STATE

function BattleEngineShiftToFinalAttack() {
	with (oCore) { state = CoreStateFinalAttack; }
	state = BattleEngineStateFinalAttack;
}

function BattleEngineStateFinalAttack() {

}