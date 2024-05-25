/// @desc
active = false;
shader_progress = 0;
shader_progress_handle = shader_get_uniform(TEST_SHADER, "progress");
shader_x_handle = shader_get_uniform(TEST_SHADER, "mid_x");
shader_y_handle = shader_get_uniform(TEST_SHADER, "mid_y");
shader_uv_center_handle = shader_get_uniform(TEST_SHADER, "uv_center");
shader_uv_dimensions_handle = shader_get_uniform(TEST_SHADER, "uv_dimensions");