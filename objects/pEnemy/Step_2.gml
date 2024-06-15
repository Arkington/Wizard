/// @desc Movement, momentum, shader

// Velocity
x += vel_x;
y += vel_y;

// Acceleration
vel_x += acc_x/FPS;
vel_y += acc_y/FPS;

// Movement to target
if (target_x != NONE) {
	var _x_dir = point_direction(x, 0, target_x, 0);
	var _x_move = lengthdir_x(target_speed, _x_dir);
	x += sign(_x_move) * min(abs(_x_move), abs(x - target_x));
}
if (target_y != NONE) {
	var _y_dir = point_direction(0, y, 0, target_y);
	var _y_move = lengthdir_y(target_speed, _y_dir);
	y += sign(_y_move) * min(abs(_y_move), abs(y - target_y));
}

// Momentum push
x += p_x;
y += p_y;

// Momentum decay
// Weight := the momentum loss in one second
p_x = sign(p_x)*max(abs(p_x) - weight/FPS, 0);
p_y = sign(p_y)*max(abs(p_y) - weight/FPS, 0);

// Damage shader
if (shader_progress <= 1) {
	switch(shader) {
		case shDamage:
			shader_progress += 1/(ENEMY_DAMAGE_SHADER_S*FPS);
			break;

		case shEnemyDie:
			shader_progress += 1/(ENEMY_DIE_SHADER_S*FPS);
			break;
			
		case shEnemyWarp:
			shader_progress += 1/(ENEMY_WARP_SHADER_S*FPS);
			break;
			
		default:
			shader_progress += 1/FPS;
			break;
	}
}
