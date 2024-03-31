// @desc Player actions
// In Begin Step so Camera (etc) can update to player movement

audio_listener_position(x, y, 0);
key.up = keyboard_check(KEY_MOVE_UP);
key.left = keyboard_check(KEY_MOVE_LEFT);
key.down = keyboard_check(KEY_MOVE_DOWN);
key.right = keyboard_check(KEY_MOVE_RIGHT);
key.interact = keyboard_check_pressed(KEY_INTERACT);
key.run = keyboard_check(KEY_RUN);

state();

// Irrespective of state
sprite_index = sprite[CARDINAL_DIR];
depth = -bbox_bottom - depth_adj;