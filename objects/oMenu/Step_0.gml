up = keyboard_check_pressed(KEY_MOVE_UP);
down = keyboard_check_pressed(KEY_MOVE_DOWN);
interact = keyboard_check_pressed(KEY_INTERACT);

n_options = array_length(options);
pos += down - up;
pos = (pos + n_options) % n_options; // Loop around