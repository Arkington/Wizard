/// @desc Battle GUI

// During init, Core drawn on GUI layer
if state == CoreStateInit {
	// Draw Core
	draw_sprite_ext(
	    sprite,
	    image_index,
	    x,
	    y,
	    image_xscale,
	    image_yscale,
	    image_angle,
	    image_blend,
	    image_alpha
	);
}


// Available attacks
var atk_pos = {};
var spr_scale = 1.5;
atk_pos[UP] = {x: RESOLUTION_W/2, y: 12};
atk_pos[LEFT] = {x: RESOLUTION_W/2 - 16, y: 16};
atk_pos[RIGHT] = {x: RESOLUTION_W/2 + 16, y: 16};
for (var i = 0; i <= 2; i++) {
	// Special frame for selected attack
	draw_sprite(
		(i == atk_select) ? sItemFrameSelected : sItemFrame,
		0,
		atk_pos[i].x,
		atk_pos[i].y
	);
	draw_sprite_ext(
		attacks[i].menu_spr,
		0,
		atk_pos[i].x,
		atk_pos[i].y,
		spr_scale,
		spr_scale,
		0,
		c_white,
		1
	);
}