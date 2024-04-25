/// @desc Creates Battle() structs.
function Battle(_wave_goal, _next_wave, _after_wave) {
	return {
		wave_goal : _wave_goal,
		NextWave : _next_wave,
		AfterWave : _after_wave,
	}
}

/// @desc Loads a Battle() struct into the BattleEngine.
function LoadBattle(_battle_struct_name) {
	with (global.battle_engine) {
		var _battle_struct = variable_global_get(_battle_struct_name);
		battle_struct = _battle_struct;
		NextWave = _battle_struct.NextWave;
		AfterWave = _battle_struct.AfterWave;
		wave_goal = _battle_struct.wave_goal;
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
function create_get_em(_wave) {
	var _get_em = instance_create_layer(GET_EM_X, GET_EM_Y, LAYER_BATTLE_GUI, oGetEm);
	with (_get_em) {
		wave = _wave;
	}
	return _get_em;
}

/// @desc Reports the defeat of an enemy to the active wave
function ReportEnemyDefeated(_enemy_id) {
	var _enemy_name = object_get_name(_enemy_id);
	
	with global.battle_engine {
		if array_contains(struct_get_names(current_wave.clear_condition_progress), _enemy_name) {
			var _enemies_remaining = max(struct_get(current_wave.clear_condition_progress, _enemy_name) - 1, 0);
			struct_set(current_wave.clear_condition_progress, _enemy_name, _enemies_remaining);
		}
	}
}


// Testing
function nw() {
	if (n_success > 2) {
		return oWaveSkullJustSittingThere;
	} else {
		return oWaveTargetJustSittingThere;
	}
}

function aw() {
	with (global.battle_engine) {
		BattleEngineShiftToBreak();
	}
}

test_battle = Battle(5, nw, aw);
