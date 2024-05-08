/// @desc

// Inherit the parent event
event_inherited();

function StateIdle() {	
	// Animate
	image_index = sprite_get_number(sprite_index) - 1;
	
	// Set up
	notice_timer = 32;
}

function StateShooting() {
	
	// Animate
	image_index = DOWN;
	
	// Fire on a timer
	notice_timer--;
	if (notice_timer <= 0) {
		CreateBullet(x, y, 270, oBulletBasic);
		state = StateIdle;
	}
}

state = StateIdle;