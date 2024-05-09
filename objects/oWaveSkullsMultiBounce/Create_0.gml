/// @desc
event_inherited();

SetBulletBox(MID_X, MID_Y + 32, 216, 96)

n_enemies = 0;
spawn_rate_s = 0.75;
spawn_radius = 24;
left = irandom(1);
vel_x = 1;
vel_x_var = 0.3;
vel_y = 3.7;
vel_y_var = 0.8;
acc_y = 3;
spin_factor_range = 5;

spawn_x_dist = 128;
spawn_y = 1/4*RESOLUTION_H
