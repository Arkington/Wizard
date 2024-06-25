/// @desc Move the attack
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Fizzle if needed
if (fizzle) {
	active = false;
	shader_progress += 1/(BULLET_FIZZLE_S*FPS);
	if (shader_progress > 1) { instance_destroy(); }
}