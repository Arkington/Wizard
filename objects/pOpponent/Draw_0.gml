/// @desc Knockback, damage shader

if (shader_progress <= 1) {
	GetUVs();
	shader_set(shader);
	
	// Set shader variables
	SetShaderUniforms();

	// Draw with adjustments
	draw_self();
	shader_reset();
} else {
	draw_self();
}