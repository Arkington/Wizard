/// @desc
var _frac_complete = t/(poof_time_s*FPS);
var _a = -PiecewiseParabolaY(_frac_complete, 1, 0.5, -0.5, 0);
print(_a);
//var _a = 1 - sqr(2*_frac_complete - 1)/2; // Image scale
var _b = sqrt(_frac_complete); // x- and y-drift

// For all poofs, drift up, drift out and scale
for (var i = 0; i < n_poofs; i++;) {
	var _poof = poofs[i];
	_poof.image_xscale = _a*poofs_scale[i]; // Start small, get big, go back to small
	_poof.image_yscale = _poof.image_xscale;
	_poof.x = x + _b*drift_x*sign(poofs_x[i]) + poofs_x[i]; // Drift out then back in
	_poof.y = y - _b*drift_y + poofs_y[i]; // Float to the top
}


// Destroy condition
t++;
if (t >= poof_time_s*FPS) {
	instance_destroy();
}