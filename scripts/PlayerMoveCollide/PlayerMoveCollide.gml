function PlayerMoveCollide() {

	// Horizontal
    if place_meeting(x + x_speed, y, [oWall, pEntitySolid]) {
        while !place_meeting(x + sign(x_speed), y, [oWall, pEntitySolid]) {
            x += sign(x_speed);
        }
        x_speed = 0;
	}
	x += x_speed;
	
	// Vertical
    if place_meeting(x, y + y_speed, [oWall, pEntitySolid]) {
        while !place_meeting(x, y + sign(y_speed), [oWall, pEntitySolid]) {
            y += sign(y_speed);
        }
        y_speed = 0;
    }
	y += y_speed;
	
}