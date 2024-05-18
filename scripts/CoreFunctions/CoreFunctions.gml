function CoreMove(_speed) {
	
	key.move_up = keyboard_check(KEY_MOVE_UP);
	key.move_left = keyboard_check(KEY_MOVE_LEFT);
	key.move_down = keyboard_check(KEY_MOVE_DOWN);
	key.move_right = keyboard_check(KEY_MOVE_RIGHT);
	
    var inputDirection = point_direction(0, 0, key.move_right - key.move_left, key.move_down - key.move_up);
    var inputMagnitude = (key.move_right - key.move_left != 0) or (key.move_down - key.move_up != 0);
	if (inputMagnitude > 0) { direction = inputDirection; }

    x_speed = _speed * lengthdir_x(inputMagnitude, inputDirection);
    y_speed = _speed * lengthdir_y(inputMagnitude, inputDirection);

    x += x_speed;
    y += y_speed;
}

/// @desc Sets aim keys. Returns an angle based on aim keys and aim lock, or NONE if an angle isn't being actively held. Requires aim_lock, aim_reset_timer, key.
function Aim() {

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

	AimLock();

    // Aiming
    var v_aim = key.aim_down - key.aim_up;
    var h_aim = key.aim_right - key.aim_left;
	var _new_angle = point_direction(0, 0, h_aim, v_aim);

	// Aim lock prevents switching to cardinal directions
	if (key.aim_held and !(aim_lock and _new_angle % 90 == 0)) { return _new_angle; }
	return NONE;
}

/// @desc Sets the Core's angle based on its aim.
function CoreAim() {
	var _aim_angle = Aim();
	if (_aim_angle != NONE) { angle = _aim_angle; }
}

/// @desc Allows players to release after aiming diagonally.  Requires aim_lock, aim_reset_timer, key.aim controls.
function AimLock() {
    aim_reset_timer--;
    if key.aim_released {
        aim_lock = true;
        aim_reset_timer = AIM_LOCK_FRAMES;
    }
    if aim_reset_timer < 0 { aim_lock = false; }
}

/// @desc Returns the index of _target_angles which is closest to _aim_angle. If there is a tie, returns NONE.
function NearestAngle(_aim_angle, _target_angles, _force_hold = true) {
	
	var _nearest = NONE;
	var shortest_angle_distance = 360;
	for (var i = 0; i < array_length(_target_angles); i++) {
		var dist = abs(angle_difference(_aim_angle, _target_angles[i]));
		if (dist < shortest_angle_distance) {
			shortest_angle_distance = dist;
			_nearest = i;
		} else if (dist == shortest_angle_distance) {
			_nearest = NONE;
		}
	}
	return _nearest;
}

/// @desc Function called when the Core suffers damage
function CoreDamage(_amt) {

	// No hit if iframes
	if (iframes) { return; }

	// Damage
	global.hp = max(global.hp - _amt, 0);
	
	// Apply iframes
	iframes = true;
	iframes_time = CORE_IFRAMES_S*FPS;

	// SFX
	audio_play_sound(sndOpen, 0, false);

	// Die
	if (global.hp <= 0) {
		DeathSequence();
	}
}