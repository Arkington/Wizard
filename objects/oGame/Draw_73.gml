/// @descr Debug Draw
if !global.debug { exit; }

with (global.text_handler) {
	image_blend = (state == stateAwaiting) ? c_white : c_yellow;
	draw_sprite_ext(
		sTextHandler,
		image_index,
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		1,
		1,
		0,
		image_blend,
		image_alpha
	);
}

with (pEntity) {
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
}

with (oPlayer) {
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
	draw_circle(
		x + lengthdir_x(INTERACT_DIST, direction) - 1,
		y + lengthdir_y(INTERACT_DIST, direction),
		1,
		false
	);
	draw_circle(
		x + lengthdir_x(INTERACT_DIST, direction - INTERACT_ANGLE) - 1,
		y + lengthdir_y(INTERACT_DIST, direction - INTERACT_ANGLE),
		1,
		false
	);
	draw_circle(
		x + lengthdir_x(INTERACT_DIST, direction + INTERACT_ANGLE) - 1,
		y + lengthdir_y(INTERACT_DIST, direction + INTERACT_ANGLE),
		1,
		false
	);
}