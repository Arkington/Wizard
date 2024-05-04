function PlayerStateFree() {

    // Movement
    var _move_speed = OVERWORLD_WALK_SPEED;
    if key.run { _move_speed = OVERWORLD_RUN_SPEED; }
    
    var _input_direction = point_direction(0, 0, key.right - key.left, key.down - key.up);
    var _input_magnitude = (key.right - key.left != 0) or (key.down - key.up != 0);
	if (_input_magnitude > 0) { direction = _input_direction; }
	
    x_speed = _move_speed * sign(lengthdir_x(_input_magnitude, _input_direction));
    y_speed = _move_speed * sign(lengthdir_y(_input_magnitude, _input_direction));

	PlayerMoveCollide();
	PlayerAnimate();
	
	// Interact key
	if (key.interact) {
		x_speed = 0;
		y_speed = 0;
		PlayerInteract();
	}
	
	depth_adj = 0; // Resets any cutscene/sitting depth adj
}

function PlayerStateCutscene() {
	PlayerAnimate();
}

// @desc Players can get up with the interact key if no thought swirl is present
function PlayerStateSitting() {
	
	// Can't get up while thinking
	if (key.interact and !instance_exists(oThoughtSwirl)) {
		state = PlayerStateCutscene;
		var _exit_face;
		
		// Get off different objects in different ways
		if (sitting_on.object_index == oBench) { _exit_face = CARDINAL_DIR; }
		if (sitting_on.object_index == oStool) { _exit_face = sitting_on.get_up_face; }
		
		// Get off the seat
		switch _exit_face {
			case LEFT:
				EventMove(id, sitting_on.bbox_left + x - bbox_right, y);
				break;
			case RIGHT:
				EventMove(id, sitting_on.bbox_right + x - bbox_left, y);
				break;
			case UP:
				EventMove(id, x, sitting_on.bbox_top + y - bbox_bottom);
				break;
			case DOWN:
				EventMove(id, x, sitting_on.bbox_bottom + y - bbox_top);
				break;
		}
		WaitForEvents();
		EventPlayerStateFree();
	}
	PlayerAnimate();
}