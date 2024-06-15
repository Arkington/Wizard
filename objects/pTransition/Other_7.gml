/// @desc On entry of new room.

room_goto(target_room);

// Kill player if NONE position given
if (target_x == NONE) or (target_y == NONE) {
	instance_destroy(oPlayer);
} else {
	// TODO: make this way more flexible when it needs to be
	if !instance_exists(oPlayer) { instance_create_layer(0, 0, LAYER_INSTANCES, oPlayer); }
	with oPlayer {
		state = PlayerStateCutscene;
		x = other.target_x;
		y = other.target_y;
		if other.target_face != NONE {
			direction = 90*other.target_face;
		}
	}
}
image_speed = -1;