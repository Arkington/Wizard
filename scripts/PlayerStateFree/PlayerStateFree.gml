function PlayerStateFree() {

    // Movement
    var move_speed = OVERWORLD_WALK_SPEED;
    if keyboard_check(KEY_RUN) { move_speed = OVERWORLD_RUN_SPEED; }
    
    var inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
    var inputMagnitude = (keyRight - keyLeft != 0) or (keyDown - keyUp != 0);
    x_speed = move_speed * lengthdir_x(inputMagnitude, inputDirection);
    y_speed = move_speed * lengthdir_y(inputMagnitude, inputDirection);
    
    // Spriting
    if (y_speed == 0 && x_speed != 0) {
        face = (x_speed > 0) ? RIGHT : LEFT;
    } else if (x_speed == 0 && y_speed != 0) {
        face = (y_speed > 0) ? DOWN : UP;
    }
    
    // Collisions
    var i = x_speed;
    while (i*sign(x_speed) > 0) {
    	if place_meeting(x + i, y, objWall) { x_speed -= sign(x_speed); }
    	i -= sign(x_speed);
    }
    var j = y_speed;
    while (j*sign(y_speed) > 0) {
    	if place_meeting(x, y + j, objWall) { y_speed -= sign(y_speed); }
    	j -= sign(y_speed);
    }
    
    // Depth
    depth = -bbox_bottom;
    
    // Moving
    x += x_speed;
    y += y_speed;
    
    // Animate
    if x_speed == 0 && y_speed == 0 {
    	image_index = 0;
    }
    sprite_index = sprite[face];

}