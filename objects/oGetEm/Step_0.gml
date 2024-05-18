/// @desc Get wave data
var _enemies = variable_struct_get_names(wave.clear_condition);
enemy_qty = struct_get(wave.clear_condition_progress, _enemies[0]);

time_remaining_s = wave.timer/FPS;