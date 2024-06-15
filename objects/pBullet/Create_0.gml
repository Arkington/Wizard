/// @desc Set up and fire

active = true;

// Fizzzle shader
fizzle = false;
shader = shBulletFizzle;
shader_progress = 0;
SetShaderHandlers(shader);

uv_mid = [];
uv_dim = [];

audio_play_sound(fire_sfx, 0, false);

on_hit = function() {};