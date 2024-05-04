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

function BattleEngineStateBreak() {

}


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
	
	// Clean up
	instance_destroy(get_em);
	instance_destroy(current_wave);
	instance_destroy(pEnemy);
	current_wave = NONE;
	
	// Go to the next state
	BattleEngineShiftToCutscene();
}
