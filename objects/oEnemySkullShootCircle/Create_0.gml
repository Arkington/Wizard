/// @desc

// Inherit the parent event
event_inherited();

StateMoving = function() {

	// Look at player
	image_angle = point_direction(x, y, oCore.x, oCore.y) - 90;


	// Animate
	image_index = sprite_get_number(sprite_index) - 1;
	
	// Set up
	notice_timer = 32;

}

StateShooting = function() {

	// Look at player
	image_angle = point_direction(x, y, oCore.x, oCore.y) - 90;

	
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