// Get 9-slice params
var _box_nineslice = sprite_get_nineslice(sprite_index);
var _nineslide_adj = _box_nineslice.left - _box_nineslice.right;
var _hp_frac = global.hp/global.max_hp;
var _drain_frac = draining_hp/global.max_hp;

// Draw HP bar
draw_sprite_stretched(
	sprite_index,
	2,
	x,
	y,
	_nineslide_adj + HP_LEN,
	sprite_height
);

// Draining hp effect
draw_sprite_stretched(
	sprite_index,
	1,
	x,
	y,
	_nineslide_adj + HP_LEN*_drain_frac,
	sprite_height
);


// Fill health
draw_sprite_stretched(
	sprite_index,
	0,
	x,
	y,
	_nineslide_adj + HP_LEN*_hp_frac,
	sprite_height
);


// Draw HP text
draw_set_text(fntText, WHITE, fa_left, fa_top);
draw_text_transformed(
	x + HP_LEN - 4,
	y + _box_nineslice.top,
	$"{global.hp}/{global.max_hp}",
	1/3,
	1/3,
	0
);