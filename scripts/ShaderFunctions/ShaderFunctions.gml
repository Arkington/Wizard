/// @desc Sets uv_dim and uv_mid for an object
function GetUVs() {
	// Get UV info
	var uvs = sprite_get_uvs(sprite_index, image_index);
	var uv_w = uvs[2] - uvs[0];
	var uv_h = uvs[3] - uvs[1];
	uv_dim = [uv_w, uv_h];
	uv_mid = [0.5*uv_w + uvs[0], 0.5*uv_h + uvs[1]];
}

/// @desc Sets common shader handlers
function SetShaderHandlers(_shader) {
	shader_progress_handle = shader_get_uniform(shader, "progress");
	shader_sprite_dim_handle = shader_get_uniform(shader, "sprite_dim");
	shader_sprite_scale_handle = shader_get_uniform(shader, "sprite_scale");
	shader_uv_mid_handle = shader_get_uniform(shader, "uv_mid");
	shader_uv_dim_handle = shader_get_uniform(shader, "uv_dim");
	shader_mid_pt_handle = shader_get_uniform(shader, "mid_pt");
}

function SetShaderUniforms() {
	shader_set_uniform_f(shader_progress_handle, shader_progress);
	shader_set_uniform_f_array(shader_mid_pt_handle, [OBJ_MID_X, OBJ_MID_Y]);
	shader_set_uniform_f_array(shader_sprite_dim_handle, [sprite_get_width(sprite_index), sprite_get_height(sprite_index)]);
	shader_set_uniform_f_array(shader_sprite_scale_handle, [image_xscale, image_yscale]);
	shader_set_uniform_f_array(shader_uv_mid_handle, uv_mid);
	shader_set_uniform_f_array(shader_uv_dim_handle, uv_dim);	
}