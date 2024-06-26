/// @desc

// Inherit the parent event
event_inherited();

notice_timer = 32;

StateUnnoticed = function() {
	
	// Move
	vel_x = target_speed;

	// Animate
	image_index = sprite_get_number(sprite_index) - 1;
	
	// Shoot if an enemy is horizontally near
	if (abs(oCore.x - x) < 4) {
		state = StateNoticed;
	}
}

StateNoticed = function() {
	
	vel_x = 0;
	
	// Animate
	if (oCore.y > y) { image_index = DOWN; }
	else { image_index = UP; }
	
	// Fire on a timer
	notice_timer--;
	if (notice_timer <= 0) {
		CreateBullet(x, y, image_index*90, oBulletBasic);
		state = StateDone;
	}
}

StateDone = function() {
	
	// Move
	vel_x = target_speed;
	
	// Animate
	image_index = sprite_get_number(sprite_index) - 1;

}

state = StateUnnoticed;