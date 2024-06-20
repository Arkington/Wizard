/// @desc
if (live_call()) return live_result;

shader = shWave;

active = false;
shader_progress = 0;
shader_speed_s = 5;
SetShaderHandlers(shader);

uv_mid = [];
uv_dim = [];