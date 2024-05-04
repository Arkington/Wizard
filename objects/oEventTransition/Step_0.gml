if !active { exit; }

// On event begin, create the transition object
if !begun {
	transition_object = instance_create_depth(0, 0, TRANSITION_DEPTH, transition_type);
	with (transition_object) {
		target_room = other.target_room;
		target_x = other.target_x;
		target_y = other.target_y;
		target_face = other.target_face;
	}
	begun = true;
}

// Complete event on transition complete
// Free player only if there are no other events
if !instance_exists(transition_object) {
	complete = true;
	if (EventQtyRemaining() <= 1) { oPlayer.state = PlayerStateFree; }
}
