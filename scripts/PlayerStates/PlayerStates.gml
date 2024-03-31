function PlayerStateFree() {

    // Movement
    var _move_speed = OVERWORLD_WALK_SPEED;
    if key.run { _move_speed = OVERWORLD_RUN_SPEED; }
    
    var _input_direction = point_direction(0, 0, key.right - key.left, key.down - key.up);
    var _input_magnitude = (key.right - key.left != 0) or (key.down - key.up != 0);
	if (_input_magnitude > 0) { direction = _input_direction; }
	
    x_speed = _move_speed * lengthdir_x(_input_magnitude, _input_direction);
    y_speed = _move_speed * lengthdir_y(_input_magnitude, _input_direction);

	PlayerMoveCollide();

    // Animate
    if x_speed == 0 && y_speed == 0 {
    	image_index = 0;
    }
	
	// Interact key
	if (key.interact) {
		x_speed = 0;
		y_speed = 0;
		PlayerInteract();
	}
}

function PlayerStateCutscene() {

    // Animate if needed
    if x_speed == 0 && y_speed == 0 {
    	image_index = 0;
    }
}

// @desc Players can get up with the interact key if no thought swirl is present
function PlayerStateSitting() {
	
	if !instance_exists(oThoughtSwirl) {
		if (key.interact) {
			state = PlayerStateCutscene;
			switch CARDINAL_DIR {
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
	}
	image_index = 0;
}