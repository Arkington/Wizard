/// @desc
event_inherited();

bb_x = RESOLUTION_W/2;
bb_y = RESOLUTION_H/2 + 16;
bb_w = 160;
bb_h = 176;
SetBulletBox(bb_x, bb_y, bb_w, bb_h);

n_rows = 5;
n_cols = 6;

row_width = 96;

x_move_amt = (row_width/n_rows)/2;
y_move_amt = (row_width/n_rows);

move_right = true;

update_frame_delay = 5;
fire_speed_s = 1;
current_enemy = n_rows*n_cols - 1;

// Create enemies
for (var j = 0; j < n_rows; j++) {
	for (var i = 0; i < n_cols; i++) {
		var _skull = instance_create_layer(
			bb_x - row_width/2 + i*(row_width/n_rows + 0.5),
			bb_y - bb_h/2 + 16 + j*(row_width/n_rows + 0.5),
			LAYER_INSTANCES,
			oEnemySkull
		)
		_skull.move_speed = LARGE; // Always end up at the target position
		array_push(enemies, _skull);
	}
}



// States
function StateHorizontalMove() {
	if (t % update_frame_delay == 0) {
		enemies[current_enemy].target_x += move_right ? x_move_amt : -x_move_amt;
		current_enemy--;
	}
	if (current_enemy < 0) {
		move_right = !move_right;
		state = StateVerticalMove;
	}
}

function StateVerticalMove() {
}

state = StateHorizontalMove;
