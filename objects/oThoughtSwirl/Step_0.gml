lifetime++;

// Keep thoughts moving
x = oPlayer.x - oCamera.x + RESOLUTION_W/2 - THOUGHT_WIDTH/2;
y = oPlayer.y - oCamera.y + RESOLUTION_H/2 - THOUGHT_HEIGHT/2

for (var i = 0; i < n_thoughts; i++) {
	thought_angles[i] += THOUGHT_ROTATE_SPEED;
	thought_textboxes[i].screenpos_x =  x + lengthdir_x(THOUGHT_RADIUS, thought_angles[i]);
	thought_textboxes[i].screenpos_y =  y + lengthdir_y(THOUGHT_RADIUS, thought_angles[i]);
	thought_textboxes[i].alpha = alpha;
}


state();