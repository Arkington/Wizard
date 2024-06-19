/// @desc
if (live_call()) return live_result;
shader_set_live(shader, true);

if (active and shader_progress > 0) {
	
	// Get UV info
	GetUVs();
	shader_set(shader);
	
	// Set shader variables
	SetShaderUniforms();
	print(current_time/1000);
	draw_self();
	shader_reset();
} else {
	draw_self();
}

draw_set_text(fntMagic);
draw_text(0, 0, $"Progress: {shader_progress}");
