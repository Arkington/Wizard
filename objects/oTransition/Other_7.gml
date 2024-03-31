room_goto(target_room);
oPlayer.x = target_x;
oPlayer.y = target_y;
if target_face != NONE { oPlayer.direction = 90*target_face; }
image_speed = -1;