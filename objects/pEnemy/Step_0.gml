lifetime++;

// Conditions
if (stunned) {
	stun_frames_left--;
	if stun_frames_left <= 0 {
		stunned = false;
		stun_frames_left = STUN_FRAMES;
	}
} else {
	enemyMove();
}