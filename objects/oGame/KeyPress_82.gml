/// @desc Restart Game
global.state = struct_copy(global.initial_state);
show_debug_message(global.initial_state);
show_debug_message(global.state);
game_restart();