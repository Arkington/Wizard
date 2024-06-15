/// @desc Fizzle if needed
if (fizzle) {
	GetUVs();
	shader_set(shader);
	SetShaderUniforms();
	draw_self();
	shader_reset();
} else {
	draw_self();
}