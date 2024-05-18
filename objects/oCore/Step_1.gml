/// @desc Goes before oBulletBox
key.fire = keyboard_check_pressed(KEY_FIRE);
key.focus = keyboard_check(KEY_FOCUS);

state();

// Turn Core
image_angle = image_angle + CORE_ROTATE_SPEED * angle_difference(angle - 90, image_angle);