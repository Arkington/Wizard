// Draw the shapes
for (var i = 0; i < array_length(shapes); i++) {
	var _shape = shapes[i];
	var _f = 1 - _shape.completion;
	draw_circle(
		x + lengthdir_x(_f*_shape.r, _shape.angle),
		y + lengthdir_y(_f*_shape.r, _shape.angle),
		_f*_shape.size,
		false
	)
}