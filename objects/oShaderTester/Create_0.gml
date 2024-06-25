/// @desc
if (live_call()) return live_result;

shader = shDamage;

active = false;
shader_progress = 0;
shader_progress_handle = shader_get_uniform(shader, "progress");
shader_sprite_dim_handle = shader_get_uniform(shader, "sprite_dim");
shader_sprite_scale_handle = shader_get_uniform(shader, "sprite_scale");
shader_uv_mid_handle = shader_get_uniform(shader, "uv_mid");
shader_uv_dim_handle = shader_get_uniform(shader, "uv_dim");
shader_mid_pt_handle = shader_get_uniform(shader, "mid_pt");
uv_mid = [];
uv_dim = [];