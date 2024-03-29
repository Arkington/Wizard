if place_meeting(x, y, oPlayer) && !instance_exists(transition_object) {
	var _transition = instance_create_depth(0, 0, -LARGE, transition_object);
	_transition.target_x = target_x;
	_transition.target_y = target_y;
	_transition.target_room = target_room;
	_transition.target_face = target_face;
	
	// If we wish to maintain a relative x/y position
	// NOTE: requires setting target x/y to the x/y of the matching warp point
	if relative_x {
		_transition.target_x += (oPlayer.x - x);
	}
	if relative_y {
		_transition.target_y += (oPlayer.y - y);
	}
}
