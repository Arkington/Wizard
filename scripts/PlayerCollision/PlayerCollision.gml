function PlayerCollision() {

    // Wall collisions
    if place_meeting(x + x_speed, y, oWall) or place_meeting(x + x_speed, y, pEntitySolid) {
        while (!place_meeting(x + sign(x_speed), y, oWall) and !place_meeting(x + sign(x_speed), y, pEntitySolid)) {
            x += sign(x_speed);
            x_speed -= sign(x_speed);
        }
        x_speed = 0;
    }
    if place_meeting(x, y + y_speed, oWall) or place_meeting(x, y + y_speed, pEntitySolid) {
        while (!place_meeting(x, y + sign(y_speed), oWall) and !place_meeting(x, y + sign(y_speed), pEntitySolid)) {
            y += sign(y_speed);
            y_speed -= sign(y_speed);
        }
        y_speed = 0;
    }
    
}