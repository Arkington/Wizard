if (live_call()) return live_result;

// Assume x, y are the top-left of the wave object


TargetBackgroundSurface();
draw_set_alpha(alpha);
draw_set_color(colour);

// Draw the rectangle
draw_rectangle(
	x, y, x + rect_w - 1, y + rect_h, false
)

// Draw the wave
shader_set(shWave);
shader_set_uniform_f(shader_n_waves_handle, n_waves);
shader_set_uniform_f(shader_wave_offset_handle, wave_offset);
shader_set_uniform_f(shader_wave_speed_handle, wave_speed);
shader_set_uniform_f(shader_time_handle, current_time/1000);
shader_set_uniform_f_array(shader_uv_mid_handle, uv_mid);
shader_set_uniform_f_array(shader_uv_dim_handle, uv_dim);

draw_sprite_ext(
	sprite_index,
	image_index,
	x + rect_w/2 + (rect_w/2 + wave_height/2) * (face == RIGHT ? 1 : -1),
	y + rect_h/2,
	image_xscale * (face == RIGHT ? 1 : -1),
	image_yscale,
	image_angle,
	colour,
	alpha
);
shader_reset();

draw_set_alpha(1);
draw_set_color(WHITE);
surface_reset_target();


