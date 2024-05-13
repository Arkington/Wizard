
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
	var atk_pos = {};
	atk_pos[UP] = {x: x, y: y - 16*ring_scale};
	atk_pos[LEFT] = {x: x - 14*ring_scale, y: y + 10*ring_scale};
	atk_pos[RIGHT] = {x: x + 14*ring_scale, y: y + 10*ring_scale};
	for (var i = 0; i <= 2; i++) {
		// Icons grow when hovering
		var atk_scale = (i==atk_hover) ? min(1 + hover_time/5, 2) : 1;
		draw_sprite_ext(
			global.attacks[i].menu_spr,
			0,
			atk_pos[i].x,
			atk_pos[i].y,
			atk_scale,
			atk_scale,
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
		var button_scale = (i == button_hover) ? min(1 + hover_time/5, 2)*time_scale : time_scale;
		var button_sprite = sButtonMagic;
		draw_sprite_ext(
			button_sprite,
			0,
			x + (lengthdir_x(BREAK_BUTTON_X_DIST, button_angles[i]) - sprite_get_width(button_sprite)/2) * button_scale,
			y + (lengthdir_y(BREAK_BUTTON_Y_DIST, button_angles[i]) - sprite_get_height(button_sprite)/2) * button_scale,
			button_scale,
			button_scale,
			0,
			c_white,
			1
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