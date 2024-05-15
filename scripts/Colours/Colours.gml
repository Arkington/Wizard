#macro WHITE c_white
#macro TEAL $87a348
#macro RED c_red
#macro BLUE c_blue
#macro RANDOM_COLOUR make_color_rgb(irandom(255), irandom(255), irandom(255))


// https://krazydad.com/tutorials/makecolors.php
function ColourGradient(t, phase1 = 0, phase2 = 120, phase3 = 240, center = 128, width = 127) {
	var _r = dsin(t + phase1) * width + center;
	var _g = dsin(t + phase2) * width + center;
	var _b = dsin(t + phase3) * width + center;
	return make_color_rgb(_r, _g, _b);
}