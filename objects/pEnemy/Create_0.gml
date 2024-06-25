if (live_call()) return live_result;


/// @desc Enemy setup

// Enemy stats
hp = max_hp;
lifetime = 0;
dead = false;

vel_x = 0;
vel_y = 0;
acc_x = 0;
acc_y = 0;
p_x = 0;
p_y = 0;
target_x = NONE;
target_y = NONE;
x_adj = 0;
y_adj = 0;

// Shader setup
shader = shDamage;
shader_progress = 1.01;
SetShaderHandlers(shader);

uv_mid = [];
uv_dim = [];


// Dying behaviour
StateDying = function() {
	if (!dead) {
		dead = true;
		ResetEnemy(self);
		shader = shEnemyDie;
		shader_progress = 0;
		SetShaderHandlers(shader);
	}
	
	if (shader_progress >= 1) {
		instance_destroy();
	}
}

// Warping (on wave-end) behaviour)
StateWarping = function() {
	if (!dead) {
		dead = true;
		shader = shEnemyWarp;
		shader_progress = 0;
		SetShaderHandlers(shader);
	}
	
	if (shader_progress >= 1) {
		instance_destroy();
	}
}


state = function() {}; // Default state does nothing




on_hit = function(_attack) {};