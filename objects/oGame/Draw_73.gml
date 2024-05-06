/// @descr Debug Draw
if !global.debug { exit; }

// Player
with (oPlayer) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	
	var _h_shift = lengthdir_x(bbox_right - bbox_left, CARDINAL_DIR*90);
	var _v_shift = lengthdir_y(bbox_bottom - bbox_top, CARDINAL_DIR*90);
	
	draw_rectangle(
		bbox_left + _h_shift,
		bbox_top + _v_shift,
		bbox_right + _h_shift,
		bbox_bottom + _v_shift,
		true
	)

}

// Entities
with (pEntity) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}

// Core
with (oCore) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}

// Attacks
with (pAttack) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}

// Enemies
with (pEnemy) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}