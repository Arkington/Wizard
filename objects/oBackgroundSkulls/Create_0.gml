// Inherit the parent event
event_inherited();

wave_1_colour = #8d3389;
wave_1_alpha = 0.5;
wave_1_rect = 24;
wave_1_amp = 128;
wave_1_speed = 0.8;
wave_1_offset = 0.5;
wave_1_n_waves = 4;

wave_2_colour = #35479f;
wave_2_alpha = 0.5;
wave_2_rect = 12;
wave_2_amp = 96;
wave_2_speed = 1.5;
wave_2_offset = 0.5;
wave_2_n_waves = 2.5;


/// @desc Creates a rectangle with a wave attached
function CreateBGSkullsWave(_x, _y, _w, _h, _n_waves, _wave_offset, _wave_speed, _wave_height, _face) {
	var _wave = instance_create_layer(_x, _y, LAYER_BATTLE_BACKGROUND, oBGSkullsWave);
	with (_wave) {
		rect_w = _w;
		rect_h = _h;
		image_xscale = _wave_height/sprite_width;
		image_yscale = _h/sprite_height;
		n_waves = _n_waves;
		wave_speed = _wave_speed;
		wave_offset = _wave_offset;
		wave_height = _wave_height;
		face = _face;
		
		GetUVs();
		shader = shWave;
		shader_uv_mid_handle = shader_get_uniform(shader, "uv_mid");
		shader_uv_dim_handle = shader_get_uniform(shader, "uv_dim");
		shader_time_handle = shader_get_uniform(shader, "time");
		shader_n_waves_handle = shader_get_uniform(shader, "n_waves");
		shader_wave_offset_handle = shader_get_uniform(shader, "wave_offset");
		shader_wave_speed_handle = shader_get_uniform(shader, "wave_speed");

		shader_set_uniform_f(shader_n_waves_handle, n_waves);
		shader_set_uniform_f(shader_wave_speed_handle, wave_speed);
		shader_set_uniform_f(shader_wave_offset_handle, wave_offset);
		shader_set_uniform_f_array(shader_uv_mid_handle, uv_mid);
		shader_set_uniform_f_array(shader_uv_dim_handle, uv_dim);
	}
	return _wave;
}

wave_1_left = CreateBGSkullsWave(
	0, 0,
	wave_1_rect, RESOLUTION_H,
	wave_1_n_waves, 0, wave_1_speed, wave_1_amp,
	RIGHT
);
wave_1_right = CreateBGSkullsWave(
	RESOLUTION_W - wave_1_rect, 0,
	wave_1_rect, RESOLUTION_H,
	wave_1_n_waves, wave_1_offset, wave_1_speed, wave_1_amp,
	LEFT
);

wave_2_left = CreateBGSkullsWave(
	0, 0,
	wave_2_rect, RESOLUTION_H,
	wave_2_n_waves, 0, wave_2_speed, wave_2_amp,
	RIGHT
);

wave_2_right = CreateBGSkullsWave(
	RESOLUTION_W - wave_2_rect, 0,
	wave_2_rect, RESOLUTION_H,
	wave_2_n_waves, wave_2_offset, wave_2_speed, wave_2_amp,
	LEFT
);