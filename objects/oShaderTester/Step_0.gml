/// @desc Increase shader_progress if active
if (active) { shader_progress = min(shader_progress + 1/FPS, 1); }
if (shader_progress >= 1) { active = false; }