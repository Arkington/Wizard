/// @desc

// Inherit the parent event
event_inherited();

t = 0;
slow_factor = 0.005;
min_speed = 0.75;
angle = 270;
rotate_speed_a = 0.8;
rotate_speed_b = 2.2;
fire_rate = 4;
bullet_spread = 2;
charge_offset = 16;
time_until_awakening_s = 2.5;
time_before_shooting_s = 1.8;

charge = noone;

StateAsleep = function() {
	image_index = LAST_FRAME;
	// Skull slow approach
	target_speed = max(target_speed*(1 - slow_factor), min_speed);
	if (t >= time_until_awakening_s*FPS) {
		charge = instance_create_layer(x, y + 16, LAYER_INSTANCES, oCharge);
		charge.charge_time_s = time_before_shooting_s;
		state = StateAwake;
		t = 0;
	}
}

StateAwake = function() {
	image_index = DOWN;
	// Try to face player
	angle += rotate_speed_a*sign(angle_difference(point_direction(x, y, oCore.x, oCore.y), angle));
	// Move charge with skull
	if instance_exists(charge) {
		charge.x = x + lengthdir_x(charge_offset, angle);
		charge.y = y + lengthdir_y(charge_offset, angle);
	}
	if (t >= time_before_shooting_s*FPS) {
		state = StateShooting;
	}
}

StateShooting = function() {
	// Try to face player
	angle += rotate_speed_b*sign(angle_difference(point_direction(x, y, oCore.x, oCore.y), angle));
	if (t % fire_rate == 0) {
		CreateBullet(x, y, angle + random_range(-bullet_spread, bullet_spread), oBulletBasic);
	}
}

state = StateAsleep;