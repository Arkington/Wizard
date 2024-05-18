/// @desc Move object towards target in a parabolic shape
if !active { exit; }


if !begun {
	begun = true;
}

// Increment timer
t++;
state();