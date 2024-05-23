/// @desc
active = false;
shader_progress = 0;
shader_progress_handle = shader_get_uniform(TEST_SHADER, "progress");

shader_width_handle = shader_get_uniform(TEST_SHADER, "sprite_w");
shader_height_handle = shader_get_uniform(TEST_SHADER, "sprite_h");
shader_uv_center_handle = shader_get_uniform(TEST_SHADER, "uv_center");
shader_uv_dimensions_handle = shader_get_uniform(TEST_SHADER, "uv_dimensions");