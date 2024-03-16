function PlayerStateFree() {

    // Movement
    var move_speed = OVERWORLD_WALK_SPEED;
    if key.run { move_speed = OVERWORLD_RUN_SPEED; }
    
    var inputDirection = point_direction(0, 0, key.right - key.left, key.down - key.up);
    var inputMagnitude = (key.right - key.left != 0) or (key.down - key.up != 0);
	if (inputMagnitude > 0) { direction = inputDirection; }
	
    x_speed = move_speed * lengthdir_x(inputMagnitude, inputDirection);
    y_speed = move_speed * lengthdir_y(inputMagnitude, inputDirection);

	PlayerCollision();
    
    x += x_speed;
    y += y_speed;

    // Animate
    if x_speed == 0 && y_speed == 0 {
    	image_index = 0;
    }
	
	// Interact key
	if (key.interact) { PlayerInteract(); }
	
    sprite_index = sprite[CARDINAL_DIR];
    depth = -bbox_bottom;
}