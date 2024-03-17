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

// Aim at a thought
CoreAim();
if key.aim_held {
	var shortest_angle_distance = 360;
	for (var i = 0; i < n_thoughts; i++) {
		var dist = abs(angle_difference(angle, thought_angles[i]));
		if (dist < shortest_angle_distance) {
			shortest_angle_distance = dist;
			hover_thought = i;
		}
	}
}

x = oPlayer.x;
y = oPlayer.y;

lifetime++;
for (var i = 0; i < n_thoughts; i++) {
    thought_angles[i] += rotate_speed;
}
