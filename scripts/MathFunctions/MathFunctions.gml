/// @desc y=1-\left(-2\operatorname{mod}\left(x,1\right)+1\right)^{2}
function f_bounce(t) {
	return 1 - sqr(2*(t % 1) - 1);
}