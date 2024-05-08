/// @desc Creates Battle() structs.
function Battle(_opponent, _wave_goal, _next_wave, _next_event) {
	return {
		opponent: _opponent,
		wave_goal : _wave_goal,
		NextWave : _next_wave,
		NextEvent : _next_event,
	}
}

/// @desc Loads a Battle() struct into the BattleEngine.
function LoadBattle(_battle_struct_name) {
	with (global.battle_engine) {
		var _battle_struct = variable_global_get(_battle_struct_name);
		battle_struct = _battle_struct;
		NextWave = _battle_struct.NextWave;
		NextEvent = _battle_struct.NextEvent;
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
function CreateGetEm(_wave) {
	var _get_em = instance_create_layer(_wave.get_em_x, _wave.get_em_y, LAYER_BATTLE_GUI, oGetEm);
	with (_get_em) {
		wave = _wave;
	}
	return _get_em;
}

/// @desc Reports the defeat of an enemy to the active wave
function ReportEnemyDefeated(_enemy_id) {
	var _enemy_name = object_get_name(_enemy_id.object_index);
	
	with global.battle_engine {
		// Update clear condition
		if array_contains(struct_get_names(current_wave.clear_condition_progress), _enemy_name) {
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
		print(_enemy_id);
		print(current_wave.enemies);
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
