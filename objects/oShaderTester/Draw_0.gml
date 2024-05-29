/// @desc
if (live_call()) return live_result;
shader_set_live(shader, true);

if (active and shader_progress > 0) {
	
	// Get UV info
	GetUVs();
	shader_set(shader);
	
	// Set shader variables
	SetShaderUniforms();

	draw_self();
	shader_reset();
} else {
	draw_self();
}

draw_set_text(fntMagic);
draw_text(0, 0, $"Progress: {shader_progress}");

draw_circle_color(x, y, 1, BLUE, BLUE, false);
draw_circle_color(OBJ_MID_X, OBJ_MID_Y, 1, RED, RED, false);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
