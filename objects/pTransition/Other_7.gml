/// @desc On entry of new room.

room_goto(target_room);

// Kill player if NONE position given
if (target_x == NONE) or (target_y == NONE) {
	instance_destroy(oPlayer);
} else {
	// TODO: make this way more flexible when it needs to be
	if !instance_exists(oPlayer) { instance_create_layer(0, 0, LAYER_INSTANCES, oPlayer); }
	oPlayer.x = target_x;
	oPlayer.y = target_y;
	if target_face != NONE { oPlayer.direction = 90*target_face; }
}
image_speed = -1;