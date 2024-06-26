if (live_call()) return live_result;

// Inherit the parent event
event_inherited();

// Randomize direction for variety
image_xscale = coin_flip();

// Animation
baby_phase = false;


post_create = function() {
	
	// Burst effect
	burst = instance_create_layer(x, y, layer, oSoulFlameBurst);
	burst.image_angle = image_angle;
}


particle_var = 1;
angle_var = 1000;

on_hit = function(_enemy) {
	
	// Scatter particles
	var _n_particles = irandom_range(3, 4);
	for (var i = 0; i < _n_particles; i++) {
		var _p = instance_create_layer(
			x,
			y,
			layer,
			oSoulFlameParticle
		)
		_p.direction = direction + rnorm(0, angle_var);
	}
	
	instance_destroy();
};