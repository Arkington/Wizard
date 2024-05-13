// Setup
t = 0;

// Attack params
charge_time_s = 1.8;
fire_time_s = 1.8;
frame_delay_between_shots = 3;
shot_angle_var = 30;

StateInit = function() {
	CreateCharge(oCore.x, oCore.y, charge_time_s);
	state = StateCharging;
}


StateCharging = function() {
	if (t > charge_time_s*FPS) {
		t = 0;
		state = StateFiring;
	}
}

StateFiring = function() {
	if (t % frame_delay_between_shots == 0) {
		CreateAttack(
			oCore.x,
			oCore.y,
			oCore.angle + random_range(-shot_angle_var, shot_angle_var),
			oAttackSoulFlame
		)
	}
	if (t > fire_time_s*FPS) {
		instance_destroy();
	}
}


state = StateInit;