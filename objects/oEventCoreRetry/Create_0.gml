/// @desc Default time, n_spins

event_inherited();

// Vars
on_knees_time_s = 1;
on_knees_shake_time_s = 0.5;
on_feet_time_s = 1;
hand_on_hat_time_s = 1;
hat_throw_time_s = 0.5;
shake_amt = 1;

// Inits
core = NONE;
dead_player = instance_find(oPlayerDead, 0);
start_x = 0;
target_x = 0;
target_x = 0;
target_y = 0;
transitioned = false;
t = 0;


// States
StateOnKnees = function() {
	dead_player.image_index = 5;
	if (t > on_knees_time_s*FPS) {
		t = 0;
		state = StateOnKneesShakey;
	}
}

StateOnKneesShakey = function() {
	dead_player.image_index = 5;
	dead_player.x_adj = random_range(-shake_amt, shake_amt);
	if (t > on_knees_shake_time_s*FPS) {
		t = 0;
		state = StateOnFeet;
	}
}

StateOnFeet = function() {
	dead_player.image_index = 6;
	dead_player.x_adj = 0;
	if (t > on_feet_time_s*FPS) {
		t = 0;
		state = StateHandOnHat;
	}
}

StateHandOnHat = function() {
	dead_player.image_index = 7;
	if (t > hand_on_hat_time_s*FPS) {
		// Throw hat
		dead_player.image_index = 8;
		dead_player.persistent = false;
		start_x = dead_player.x;
		start_y = dead_player.y;
		t = 0;
		state = StateThrowHat;
	}
}
StateThrowHat = function() {
	core = core ?? instance_create_depth(start_x, start_y, TRANSITION_DEPTH - 1, oCore);
	core.x = lerp(start_x, target_x, t/(hat_throw_time_s*FPS));
	core.y = lerp(start_y, target_y, t/(hat_throw_time_s*FPS));
	core.persistent = true;
	core.state = CoreStateInit;
	
	if (t > hat_throw_time_s*FPS/2 and !transitioned) {
		CreateTransition(rParent, 0, 0, NONE);
		transitioned = true;
	}
	
	if (t > hat_throw_time_s*FPS) {
		complete = true;
	}
}

state = StateOnKnees;