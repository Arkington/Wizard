start_x = x;
start_y = y;

hidden = false;
hittable = false;

// Momentum
p_x = 0;
p_y = 0;

// Shader setup
shader = shDamage;
shader_progress = 1.01;
SetShaderHandlers(shader);