room_goto(target_room);
objPlayer.x = target_x;
objPlayer.y = target_y;
if target_face != NONE { objPlayer.face = target_face; }
image_speed = -1;