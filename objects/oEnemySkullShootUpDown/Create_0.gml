/// @desc

// Inherit the parent event
event_inherited();

notice_timer = 32;

StateUnnoticed = function() {
	speed = 2;
	image_index = sprite_get_number(sprite_index) - 1;
	// Shoot if an enemy is horizontally near
	if (abs(oCore.x - x) < 4) {
		state = StateNoticed;
	}
}

StateNoticed = function() {
	speed = 0;
	// Look up/down before shooting
	if (oCore.y > y) { image_index = DOWN; }
	else { image_index = UP; }
	notice_timer--;
	if (notice_timer <= 0) {
		CreateBullet(x, y, image_index*90, oBulletBasic);
		notice_timer = 32;
		state = StateDone;
	}
}

StateDone = function() {
	speed = 2;
	image_index = sprite_get_number(sprite_index) - 1;
}

state = StateUnnoticed;