/// @desc

// Fade out/in
if (hidden) {
	image_alpha = max(image_alpha - OPPONENT_FADE_SPEED, 0);
} else {
	image_alpha = min(image_alpha + OPPONENT_FADE_SPEED, 1);
}