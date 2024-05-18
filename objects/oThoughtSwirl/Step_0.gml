lifetime++;

// Keep thoughts moving
x = follow_obj.x - oCamera.x + MID_X;
y = follow_obj.y - oCamera.y + MID_Y;

for (var i = 0; i < n_thoughts; i++) {
	thought_angles[i] += rotate_speed;
	thought_textboxes[i].screenpos_x =  x + lengthdir_x(THOUGHT_RADIUS, thought_angles[i]) - thought_scales[i]*THOUGHT_WIDTH/2;
	thought_textboxes[i].screenpos_y =  y + lengthdir_y(THOUGHT_RADIUS, thought_angles[i]) - thought_scales[i]*THOUGHT_HEIGHT/2;
	thought_textboxes[i].alpha = alpha;
	thought_textboxes[i].scale = THOUGHT_TEXT_SCALE*thought_scales[i];
}

state();
