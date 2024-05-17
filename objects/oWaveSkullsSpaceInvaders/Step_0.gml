/// @desc
event_inherited();

// Move
state();

// Shoot
var _ready_enemies = [];
var _enemy_cols = [];
var _enemy_ys = [];
if (t % (fire_speed_s*FPS) == 0) {

	// Identify the enemies at the front
	for (var i = 0; i < array_length(enemies); i++) {
		var _enemy = enemies[i];
		var _enemy_col = i % n_cols;
		
		if (_enemy == ENEMY_DOWN) { continue; }
        var _index = array_index_of(_enemy_cols, _enemy_col);
        if (_index == -1) { // Not found
			array_push(_ready_enemies, _enemy);
			array_push(_enemy_cols, _enemy_col);
			array_push(_enemy_ys, _enemy.y);
        } else if (_enemy.y > _enemy_ys[_index]) {
            // Update the existing entry with the new front-most enemy
            _ready_enemies[_index] = _enemy;
            _enemy_ys[_index] = _enemy.y;
		}
	}
	
	// Pick one to fire
	if (array_length(_ready_enemies) > 0) {
		var _chosen = array_choose(_ready_enemies);
		_chosen.state = _chosen.StateShooting;
	}
}

// End prematurely if skulls advance too far
for (var i = 0; i < array_length(enemies); i++) {
	if (enemies[i] != ENEMY_DOWN and enemies[i].y > 208) { over = true; }
}