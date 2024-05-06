// Get 9-slice params
var _box_nineslice = sprite_get_nineslice(sprite_index);
var _hp_frac = global.hp/global.max_hp;
var _drain_frac = draining_hp/global.max_hp;

// Draw HP bar
draw_sprite_stretched(
	sprite_index,
	image_index,
	x,
	y,
	HP_LEN,
	sprite_height
);

// Draining hp effect
draw_rectangle_color(
	x + _box_nineslice.left,
	y + _box_nineslice.top,
	x + _box_nineslice.left + (HP_LEN - _box_nineslice.right - _box_nineslice.left)*_drain_frac - 1,
	y + sprite_height - _box_nineslice.bottom - 1,
	RED, RED, RED, RED,
	false
)

// Fill health
draw_rectangle_color(
	x + _box_nineslice.left,
	y + _box_nineslice.top,
	x + _box_nineslice.left + (HP_LEN - _box_nineslice.right - _box_nineslice.left)*_hp_frac - 1,
	y + sprite_height - _box_nineslice.bottom - 1,
	TEAL, TEAL, TEAL, TEAL,
	false
)

// Draw HP text
draw_set_text(fntText, WHITE, fa_left, fa_top);
draw_text_transformed(
	x + HP_LEN,
	y + _box_nineslice.top,
	$"{global.hp}/{global.max_hp}",
	1/3,
	1/3,
	0
);