// Movement
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Animation
if (image_index > 3) { baby_phase = false; }
if (baby_phase and image_index < 3) { image_index = 3; }