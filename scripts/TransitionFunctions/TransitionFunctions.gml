/// @desc Create a transition.
function CreateTransition(_target_room, _target_x, _target_y, _target_face, _type = oTransitionFade) {
	var _transition_object = instance_create_depth(0, 0, TRANSITION_DEPTH, _type);
	with (_transition_object) {
		target_room = _target_room;
		target_x = _target_x;
		target_y = _target_y;
		target_face = _target_face;
	}
	return _transition_object
}