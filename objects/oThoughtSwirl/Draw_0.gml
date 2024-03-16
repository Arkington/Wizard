/// @desc

for (var i = 0; i < n_thoughts; i++) {
	hover_scale = (i == hover_thought) ? 2 : 1;

    draw_circle(
        x + lengthdir_x(thought_radius, thought_angles[i]),
        y + lengthdir_y(thought_radius, thought_angles[i]),
        4*hover_scale,
        false
    );
}
