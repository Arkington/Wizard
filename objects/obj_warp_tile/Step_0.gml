if place_meeting(x, y, objAxel) && !instance_exists(transition_object) {
	var _transition = instance_create_depth(0, 0, -9999, transition_object);
	_transition.target_x = target_x;
	_transition.target_y = target_y;
	_transition.target_room = target_room;
	_transition.target_face = target_face;
}
