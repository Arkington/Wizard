/// @desc
event_inherited();

SetBulletBox(RESOLUTION_W/2, RESOLUTION_H/2 + 16, 64, 64)


n_enemies = 16;
radius = 160;
end_radius = 80;
rotate_speed = 1;
fire_speed_s = 1;


// Create enemies
for (var i = 0; i < n_enemies; i++) {
	var _theta = i*360/n_enemies
	var _skull = instance_create_layer(
		oBulletBox.target_x + lengthdir_x(radius, _theta + t),
		oBulletBox.target_y + lengthdir_y(radius, _theta + t),
		LAYER_INSTANCES,
		oEnemySkullShootCircle
	)
	array_push(enemies, _skull);
}