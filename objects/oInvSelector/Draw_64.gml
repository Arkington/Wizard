if (live_call()) return live_result;

// Held item
if (held_item != NONE) {
	DrawItem(
		held_item,
		x + item_offset,
		y + item_offset - z,
		true,
		1,
		1,
		1 + z
	)
}

// Swapping items
DrawSwapInItem = function() {
	
	DrawItem(
		swap_in_item,
		x + item_offset + a*cos(swap_progress*pi + pi/2),
		y + item_offset + b*sin(swap_progress*pi + pi/2) - b,
		true,
		1,
		1,
		1 - b*sin(swap_progress*pi + pi/2) + b
	)
}

DrawSwapOutItem = function() {
	
	DrawItem(
		swap_out_item,
		x + item_offset + a*cos(swap_progress*pi - pi/2),
		y + item_offset + b*sin(swap_progress*pi - pi/2) - b,
		true,
		1,
		1,
		1 - b*sin(swap_progress*pi - pi/2) + b
	)
}

// Draw swapping items
if (swap_in_item != NONE and swap_progress < 0.5) {
	DrawSwapInItem();
	DrawSwapOutItem();
} else if (swap_in_item != NONE) {
	DrawSwapOutItem();
	DrawSwapInItem();
}

// Selector
draw_sprite_stretched(
	sprite_index,
	image_index,
	x + x_offset,
	y + y_offset - z,
	w,
	h
)