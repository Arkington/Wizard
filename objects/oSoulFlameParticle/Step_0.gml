if (live_call()) return live_result;

// Death
if (image_index >= LAST_FRAME) { instance_destroy(); }

// Speed and momentum
x += lengthdir_x(move_speed, direction);
y += lengthdir_y(move_speed, direction);
move_speed *= 0.95;

// Opacity
t++;
image_alpha = 1 - t/(FPS*1);