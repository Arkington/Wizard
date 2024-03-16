/// @desc Sets angle. Requires aim_lock, aim_reset_timer, key.aim controls.
function CoreAim() {

    // Aim lock - allows players to release after aiming diagonally
    aim_reset_timer--;
    if key.aim_held and key.aim_released {
        aim_lock = true;
        aim_reset_timer = AIM_LOCK_FRAMES;
    }
    if aim_reset_timer < 0 { aim_lock = false; }

    // Aiming
    var v_aim = key.aim_down - key.aim_up;
    var h_aim = key.aim_right - key.aim_left;
	var _new_angle = point_direction(0, 0, h_aim, v_aim);
	// Aim lock prevents switching to cardinal directions
	if (key.aim_held and !(aim_lock and _new_angle % 90 == 0)) { angle = _new_angle; }

}