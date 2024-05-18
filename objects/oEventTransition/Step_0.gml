if !active { exit; }

// On event begin, create the transition object
if !begun {
	transition_object = CreateTransition(target_room, target_x, target_y, target_face, transition_type);
	begun = true;
}

// Complete event on transition complete
// Free player only if there are no other events
if !instance_exists(transition_object) {
	complete = true;
	if (EventQtyRemaining() <= 1) { oPlayer.state = PlayerStateFree; }
}
