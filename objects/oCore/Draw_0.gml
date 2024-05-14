
var draw_adj_x = 0;
var draw_adj_y = 0;


// Focus UI
if (state == CoreStateFocus) {

	// Ring
    var ring_scale = min(time_in_state, 5)/5;
    var ring_alpha = 0.5 + min(time_in_state, 15)/15;
    draw_sprite_ext(
        sFocusRing,
        0,
        x + sin(1.5*time_in_state)/2,
        y,
        ring_scale,
        ring_scale,
        0,
        c_white,
        ring_alpha
    );
	
	// Shake Core
    draw_adj_x = sin(time_in_state)/2;
	
	// Attacks
	for (var i = 0; i <= 2; i++) {
		// Icons grow when hovering
		draw_sprite_ext(
			global.attacks[i].menu_spr,
			0,
			x + lengthdir_x(FOCUS_ATTACK_X_DIST, attack_angles[i])*ring_scale,
			y + lengthdir_y(FOCUS_ATTACK_Y_DIST, attack_angles[i])*ring_scale,
			attack_scales[i],
			attack_scales[i],
			0,
			c_white,
			1
		);
	}
}

// Break UI
if (state == CoreStateBreak) {
	
	// Buttons
	var time_scale = min(time_in_state/15, 1);

	for (var i = 0; i < n_buttons; i++) {
		
		// Icons grow when hovering
		draw_set_text(fntText, WHITE, fa_center, fa_middle);
		var _col = (buttons[i] == BUTTON_READY and powered_up) ? RANDOM_COLOUR : WHITE;
		draw_text_transformed_color(
			x + lengthdir_x(BREAK_BUTTON_X_DIST, button_angles[i]),
			y + lengthdir_y(BREAK_BUTTON_Y_DIST, button_angles[i]),
			buttons[i],
			button_scales[i]*time_scale,
			button_scales[i]*time_scale,
			0,
			_col, _col, _col, _col, image_alpha
		);
	}
}


// Draw Core
if (state != CoreStateInit) and !(iframes and round(iframes_time/CORE_IFRAMES_BLINK_FRAMES) % 2 == 0) {
	// Draw Core
	draw_sprite_ext(
	    sprite,
	    image_index,
	    x + draw_adj_x,
	    y,
	    (2/3),
	    (2/3),
	    image_angle,
	    image_blend,
	    image_alpha
	);
}