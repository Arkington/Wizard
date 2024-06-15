/// @desc Set depth and animate
if standard_animation { EntityAnimate(); }

depth = -bbox_bottom;
if (always_underfoot) {
	depth += sprite_height;
}