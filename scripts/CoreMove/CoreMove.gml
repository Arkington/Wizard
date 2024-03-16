function CoreMove(_speed){
    var inputDirection = point_direction(0, 0, key.move_right - key.move_left, key.move_down - key.move_up);
    var inputMagnitude = (key.move_right - key.move_left != 0) or (key.move_down - key.move_up != 0);
	if (inputMagnitude > 0) { direction = inputDirection; }

    x_speed = _speed * lengthdir_x(inputMagnitude, inputDirection);
    y_speed = _speed * lengthdir_y(inputMagnitude, inputDirection);

    x += x_speed;
    y += y_speed;
}