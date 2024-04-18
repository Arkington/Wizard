/// @desc Move object towards target
if !active { exit; }


if !begun {
	t = 0;
	begun = true;
}

t++;
obj_to_jump.z = height*(1-power(1-2*t/total_frames, 2));

// Complete condition
if (t == total_frames) { complete = true; }