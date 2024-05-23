/// @desc

// Star spawning
if (random(1) < star_mean_spawn_per_second/FPS) {
	var _new_star = instance_create_layer(
		irandom(RESOLUTION_W),
		irandom(RESOLUTION_H) + star_spawn_y_shift,
		LAYER_BATTLE_BACKGROUND,
		oBgStar
	);
	with (_new_star) {
	
		// Speed
		move_speed = random_range(other.star_min_speed, other.star_max_speed);
	
		// Size
		image_xscale = random_range(other.star_min_scale, other.star_max_scale);
		image_yscale = image_xscale;
		
		// Alpha
		image_alpha = random_range(other.star_min_alpha, other.star_max_alpha);
	}
	array_push(stars, _new_star);
}

// Star movement and exploding
for (var i = 0; i < array_length(stars); i++) {
	var _star = stars[i];
	// Delete star if done
	if (_star.image_index >= _star.image_number - 1) {
		array_delete(stars, i, 1);
		instance_destroy(_star);
		i--;
		continue;
	}
	
	// Move star
	_star.y -= _star.move_speed;
	
	// Randomly explode
	if (random(1) < star_mean_explode_per_second/FPS) {
		_star.image_speed = _star.move_speed/star_max_speed;
	}
}