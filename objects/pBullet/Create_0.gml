/// @desc Set up and fire

active = true;

// Fizzzle shader
fizzle = false;
shader_progress = 0;
shader_progress_handle = shader_get_uniform(TEST_SHADER, "progress");
shader_x_handle = shader_get_uniform(TEST_SHADER, "mid_x");
shader_y_handle = shader_get_uniform(TEST_SHADER, "mid_y");
shader_uv_mid_handle = shader_get_uniform(TEST_SHADER, "uv_mid");
shader_uv_dim_handle = shader_get_uniform(TEST_SHADER, "uv_dim");

uv_mid = [];
uv_dim = [];

audio_play_sound(fire_sfx, 0, false);

on_hit = function() {};