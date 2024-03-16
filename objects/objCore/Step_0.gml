
key.move_up = keyboard_check(KEY_MOVE_UP);
key.move_left = keyboard_check(KEY_MOVE_LEFT);
key.move_down = keyboard_check(KEY_MOVE_DOWN);
key.move_right = keyboard_check(KEY_MOVE_RIGHT);

key.aim_up = keyboard_check(KEY_AIM_UP);
key.aim_left = keyboard_check(KEY_AIM_LEFT);
key.aim_down = keyboard_check(KEY_AIM_DOWN);
key.aim_right = keyboard_check(KEY_AIM_RIGHT);
key.aim_held = key.aim_up or key.aim_left or key.aim_right or key.aim_down;
key.aim_released = (
    keyboard_check_released(KEY_AIM_UP) or
    keyboard_check_released(KEY_AIM_LEFT) or
    keyboard_check_released(KEY_AIM_DOWN) or
    keyboard_check_released(KEY_AIM_RIGHT)
);

key.fire = keyboard_check_pressed(KEY_FIRE);
key.focus = keyboard_check(KEY_FOCUS);



time_in_state++;
state();


image_angle = image_angle + CORE_ROTATE_SPEED * angle_difference(angle - 90, image_angle);