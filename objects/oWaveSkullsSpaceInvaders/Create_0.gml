/// @desc
event_inherited();


SetBulletBox(MID_X, 208, 160, 16);

n_rows = 5;
n_cols = 7;

invaders_y = 40; // Height where the enemies start
row_width = 104; // Width of the row of enemies
move_width = 144; // Width of the area of enemy movement

x_move_amt = 4;
y_move_amt = 12;

move_right = true;

update_frame_delay = 4;
fire_speed_s = 1;
current_enemy = n_rows*n_cols - 1;

enemy_grid = [];

// Create enemies
for (var j = 0; j < n_rows; j++) {
	for (var i = n_cols - 1; i >= 0; i--) {
		var _skull = instance_create_layer(
			MID_X - row_width/2 + i*(row_width/n_rows + 0.5),
			invaders_y + j*(row_width/n_rows + 0.5),
			LAYER_INSTANCES,
			oEnemySkullSpaceInvaders
		)
		array_push(enemies, _skull);
		enemy_grid[i][j] = _skull;
	}
}

// How far do we move along before moving down
left_edge = MID_X - move_width/2;
right_edge = MID_X + move_width/2;
leftmost = MID_X;
rightmost = MID_X;

// States
function StateHorizontalMove() {
	if (t % update_frame_delay == 0) {
		// Skip down enemies
		while (current_enemy >= 0 and enemies[current_enemy] == ENEMY_DOWN) { current_enemy--; }
		if (current_enemy >= 0) {
			var _skull = enemies[current_enemy];
			_skull.x += move_right ? x_move_amt : -x_move_amt;
			// Check if this is on an edge
			if (_skull.x < leftmost) { leftmost = _skull.x; }
			if (_skull.x > rightmost) { rightmost = _skull.x; }
			current_enemy--;
		}
	}
	if (current_enemy < 0) {
		// Finished one move
		current_enemy = array_length(enemies) - 1;

		if ((move_right and rightmost >= right_edge) or (!move_right and leftmost <= left_edge)) {
			move_right = !move_right;
			leftmost = MID_X;
			rightmost = MID_X;
			state = StateVerticalMove;
		}
	}
}

function StateVerticalMove() {
	
	if (t % update_frame_delay == 0) {
		// Skip down enemies
		while (current_enemy >= 0 and enemies[current_enemy] == ENEMY_DOWN) { current_enemy--; }
		if (current_enemy >= 0) {
			enemies[current_enemy].y += y_move_amt;
			current_enemy--;
		}
	}
	
	if (current_enemy < 0) {
		// Speed up
		update_frame_delay = max(update_frame_delay - 1, 1);
		current_enemy = array_length(enemies) - 1;
		state = StateHorizontalMove;
	}
	
}

state = StateHorizontalMove;
