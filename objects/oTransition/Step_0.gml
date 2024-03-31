if room == target_room && image_index < 1 {
	oPlayer.state = PlayerStateFree;
	instance_destroy();
}