/// @desc Warp tile trigger function
function WarpTileTrigger() {
	if !instance_exists(oEventTransition) {

		// If we wish to maintain a relative x/y position
		// Set target x/y to the x/y of the (player whilst positioned at the top/right-most warp point)
		if relative_x {
			target_x += (oPlayer.x - x - sprite_get_xoffset(oPlayer.sprite_index));
		}
		if relative_y {
			target_y += (oPlayer.y - y - sprite_get_yoffset(oPlayer.sprite_index));
		}
		EventTransition(target_room, target_x, target_y, target_face, transition_type);

	}
}