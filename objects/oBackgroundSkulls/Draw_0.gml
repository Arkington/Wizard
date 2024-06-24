/// @desc Horizontal line effect
TargetBackgroundSurface();
for (var i = 0; i < RESOLUTION_H; i++) {
	if !(i % 4 == 0) { continue; }
	draw_set_alpha(0.5);
	draw_rectangle_color(
		0, i, RESOLUTION_W, i + 1,
		BLACK, BLACK, BLACK, BLACK,
		false
	);
	draw_set_alpha(1);
}
surface_reset_target();