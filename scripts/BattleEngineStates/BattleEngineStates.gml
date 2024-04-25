/// @desc Battle Engine State Machine



function BattleEngineStateInit() {
	
}

function BattleEngineStateCutscene() {

}

function BattleEngineStateEnd() {

}


// AWAITING STATE
function BattleEngineStateAwaiting() {
	if (battle_struct != NONE) {
		bullet_box = instance_create_layer(BB_X, BB_Y, LAYER_BATTLE_GUI, oBulletBox);
		hp_bar = instance_create_layer(HP_X, HP_Y, LAYER_BATTLE_GUI, oHP);
		attack_ui = instance_create_layer(0, 0, LAYER_BATTLE_GUI, oAttackUI);
		meter = instance_create_layer(METER_X, METER_Y, LAYER_BATTLE_GUI, oMeter);
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
	get_em = create_get_em(current_wave);

	with (oCore) { state = CoreStateFree; }

	state = BattleEngineStateWave;
}

function BattleEngineStateWave() {
	
	if !current_wave.over { return; }
	
	// Win
	if (current_wave.clear) {
		n_success++;
		array_push(waves_cleared, current_wave);
	}
	// Lose
	else {
		n_failure++;
		array_push(waves_failed, current_wave);
	}
	
	// Clean up
	instance_destroy(get_em);
	instance_destroy(current_wave);
	current_wave = NONE;
	
	// Go to the next state
	AfterWave();
}
