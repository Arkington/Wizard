// Inherit the parent event
event_inherited();

// Randomize direction for variety
image_xscale = coin_flip();

// Animation
baby_phase = false;


post_create = function() {
	
	// Burst effect
	burst = instance_create_depth(x, y, layer, oSoulFlameBurst);
	burst.image_angle = image_angle;
}


on_hit = function(_enemy) {
	
	// Scatter particles
	var _n_particles = irandom_range(2, 4);
	for (var i = 0; i < _n_particles; i++) {
		instance_create_layer(
			_enemy.x + random_range(-4, 4),
			_enemy.y + random_range(-4, 4),
			layer,
			oSoulFlameParticle
		)
	}
	
	instance_destroy();
};