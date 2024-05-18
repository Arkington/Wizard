target_x = 0;
target_y = 0;
target_room = 0;
target_face = 0;
kill_player = false;


// On creation, disable player movement
with (oPlayer) {
	x_speed = 0;
	y_speed = 0;
	state = PlayerStateCutscene;
}