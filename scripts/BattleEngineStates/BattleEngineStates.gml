/// @desc Battle Engine State Machine

function BattleEngineStateAwaiting() {
	if (wave_goal != NONE) {
		print($"ID within the engine: {id}");

		state = BattleEngineStateBreak;
	}
}

function BattleEngineStateInit() {
	
}

function BattleEngineStateBreak() {
	
	// Start next wave
	if (keyboard_check_pressed(ord("C"))) {
		current_wave = instance_create_layer(0, 0, LAYER_MECHANICS, NextWave());
		state = BattleEngineStateWave;
	}
}

function BattleEngineStateCutscene() {

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
	instance_destroy(current_wave);
	current_wave = NONE;
	
	// Go to the next state
	AfterWave();
}

function BattleEngineStateEnd() {

}