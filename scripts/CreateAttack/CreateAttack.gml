function CreateAttack(_x, _y, _angle, _atk_object){
	var attack = instance_create_layer(_x, _y, LAYER_INSTANCES, _atk_object);
	with (attack) {
		image_angle = _angle - 90;
		direction = _angle;
	}
}