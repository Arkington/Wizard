/// @descr Update Camera

// Update destination
if (instance_exists(follow)) {
	x = follow.x;
	y = follow.y;
}

// Keep camera center inside room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

// Screenshake
ExecuteShake();

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);