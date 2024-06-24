/// @desc Warp tile trigger function
function WarpTileTrigger() {
	if !instance_exists(oEventTransition) {

		// If we wish to maintain a relative x/y position
		// Set target x/y to the x/y of the player
		if relative_x {
			target_x += (oPlayer.x - x);
		}
		if relative_y {
			target_y += (oPlayer.y - y);
		}
		EventTransition(target_room, target_x, target_y, target_face, transition_type);

	}
}