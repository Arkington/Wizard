/// @desc
function CreateEnemy(_x, _y, _type, _params = {}) {
	if (global.battle_engine.state == BattleEngineStateWaveCooloff) { return ENEMY_DOWN; }
	var _enemy = instance_create_layer(_x, _y, LAYER_INSTANCES, _type);
	with (_enemy) {
		// Add any optional params supplied on creation
		struct_foreach(_params, function(_param, _value) {
			variable_instance_set(id, _param, _value);
		});
	}
	return _enemy;
}