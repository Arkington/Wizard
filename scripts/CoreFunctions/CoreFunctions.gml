function CoreMove(_speed){
    var inputDirection = point_direction(0, 0, key.move_right - key.move_left, key.move_down - key.move_up);
    var inputMagnitude = (key.move_right - key.move_left != 0) or (key.move_down - key.move_up != 0);
	if (inputMagnitude > 0) { direction = inputDirection; }

    x_speed = _speed * lengthdir_x(inputMagnitude, inputDirection);
    y_speed = _speed * lengthdir_y(inputMagnitude, inputDirection);

    x += x_speed;
    y += y_speed;
}

/// @desc Returns an angle based on aim keys and aim lock, or NONE if an angle isn't being actively held. Requires aim_lock, aim_reset_timer, key.aim controls.
function Aim() {

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

/// @desc Returns the index of _target_angles which is closest to _aim_angle.
function NearestAngle(_aim_angle, _target_angles, _force_hold = true) {
	
	var _nearest = NONE; // What we hover over

	var shortest_angle_distance = 360;
	for (var i = 0; i < array_length(_target_angles); i++) {
		var dist = abs(angle_difference(_aim_angle, _target_angles[i]));
		if (dist < shortest_angle_distance) {
			shortest_angle_distance = dist;
			_nearest = i;
		}
	}
	
	return _nearest;
}

function CoreDamage(_amt) {

	// No hit if iframes
	if (iframes) { return; }

	// Damage
	global.hp -= _amt;
	
	// Apply iframes
	iframes = true;
	iframes_time = CORE_IFRAMES_S*FPS;

	// SFX
	audio_play_sound(sndOpen, 0, false);

	// Die
	if (global.hp <= 0) {
		print("OH NO AXEL HAS DIED.");
	}
}