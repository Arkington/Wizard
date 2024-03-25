function PlayerStateFree() {

    // Movement
    var _move_speed = OVERWORLD_WALK_SPEED;
    if key.run { _move_speed = OVERWORLD_RUN_SPEED; }
    
    var _input_direction = point_direction(0, 0, key.right - key.left, key.down - key.up);
    var _input_magnitude = (key.right - key.left != 0) or (key.down - key.up != 0);
	if (_input_magnitude > 0) { direction = _input_direction; }
	
    x_speed = _move_speed * lengthdir_x(_input_magnitude, _input_direction);
    y_speed = _move_speed * lengthdir_y(_input_magnitude, _input_direction);

	PlayerCollision();
    
    x += x_speed;
    y += y_speed;

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