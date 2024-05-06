function CreateBullet(_x, _y, _angle, _bullet_obj) {
	var bullet = instance_create_layer(_x, _y, LAYER_INSTANCES, _bullet_obj);
	with (bullet) {
		image_angle = _angle - 90;
		direction = _angle;
	}
}
