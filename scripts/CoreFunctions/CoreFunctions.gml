function CoreMove(_speed){
    var inputDirection = point_direction(0, 0, key.move_right - key.move_left, key.move_down - key.move_up);
    var inputMagnitude = (key.move_right - key.move_left != 0) or (key.move_down - key.move_up != 0);
	if (inputMagnitude > 0) { direction = inputDirection; }

    x_speed = _speed * lengthdir_x(inputMagnitude, inputDirection);
    y_speed = _speed * lengthdir_y(inputMagnitude, inputDirection);

    x += x_speed;
    y += y_speed;
}

/// @desc Sets angle. Requires aim_lock, aim_reset_timer, key.aim controls.
function CoreAim() {

	AimLock();

    // Aiming
    var v_aim = key.aim_down - key.aim_up;
    var h_aim = key.aim_right - key.aim_left;
	var _new_angle = point_direction(0, 0, h_aim, v_aim);
	// Aim lock prevents switching to cardinal directions
	if (key.aim_held and !(aim_lock and _new_angle % 90 == 0)) { angle = _new_angle; }

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

/// @desc Returns the index of _target_angles which is closest to _aim_angle. Requires key.aim_held, hover_time. Optionally allow hover without holding down an aim key.
function AimHover(_aim_angle, _target_angles, _force_hold = true) {
	
	var _hover = NONE; // What we hover over

	// Aim at a target
	if (key.aim_held or !_force_hold) {
		var _old_hover = _hover;
		var shortest_angle_distance = 360;
		for (var i = 0; i < array_length(_target_angles); i++) {
			var dist = abs(angle_difference(_aim_angle, _target_angles[i]));
			if (dist < shortest_angle_distance) {
				shortest_angle_distance = dist;
				_hover = i;
			}
		}
		if _old_hover != _hover { hover_time = 0; }
		hover_time++;
	}
	
	return _hover;
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