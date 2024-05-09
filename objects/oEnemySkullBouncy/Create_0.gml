/// @desc

// Inherit the parent event
event_inherited();

spin_factor = 1;
image_angle = random(360);

StateMoving = function() {
		
	// Animate
	image_index = sprite_get_number(sprite_index) - 1;
	
	// Set up
	notice_timer = 32;

}

StateShooting = function() {
	
	// Animate
	image_index = DOWN;
	
	// Fire on a timer
	notice_timer--;
	if (notice_timer <= 0) {
		CreateBullet(x, y, image_angle + 90, oBulletBasic);
		state = StateMoving;
	}
}

state = StateMoving;