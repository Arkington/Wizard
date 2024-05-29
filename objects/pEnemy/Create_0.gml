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
shader_progress = 1;
SetShaderHandlers(shader);

uv_mid = [];
uv_dim = [];

StateDying = function() {
	if (shader_progress >= 1) {
		instance_destroy();
	}
}
state = function() {}; // Default state does nothing




on_hit = function(_attack) {};