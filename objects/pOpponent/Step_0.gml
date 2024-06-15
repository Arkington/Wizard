/// @desc Fade, shader, knockback, move.

// Fade out/in
if (hidden) {
	image_alpha = max(image_alpha - OPPONENT_FADE_SPEED, 0);
} else {
	image_alpha = min(image_alpha + OPPONENT_FADE_SPEED, 1);
}

// Shader progress
if (shader_progress <= 1) {
	shader_progress += 1/(ENEMY_DAMAGE_SHADER_S*FPS)
}

// Movement
var _move_dir = point_direction(x, y, start_x, start_y);
var _move_amt = min(
	move_speed*sqrt(sqr(x - start_x) + sqr(y - start_y))*OPPONENT_MAGNET_FACTOR,
	abs(point_distance(x, y, start_x, start_y))
);
x += lengthdir_x(_move_amt, _move_dir);
y += lengthdir_y(_move_amt, _move_dir);

// Momentum
x += p_x;
y += p_y;

// Momentum decay
// Weight := the momentum loss in one second
p_x = sign(p_x)*max(abs(p_x) - weight/FPS, 0);
p_y = sign(p_y)*max(abs(p_y) - weight/FPS, 0);