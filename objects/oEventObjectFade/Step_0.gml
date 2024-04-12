/// @desc
if !active { exit; }

if (in_or_out == IN) {
	
	// Fade in
	obj_to_fade.image_alpha = min(obj_to_fade.image_alpha + fade_rate, 1);

	if (obj_to_fade.image_alpha >= 1) {
		complete = true;
	}
} else {
	
	// Fade out
	obj_to_fade.image_alpha = max(obj_to_fade.image_alpha - fade_rate, 0);

	if (obj_to_fade.image_alpha <= 0) {
		complete = true;
	}
}
