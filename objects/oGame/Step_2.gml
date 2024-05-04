/// @desc Debug output
if !global.debug { exit; }


// Player
with (oPlayer) {
	print($"Player state: {script_get_name(state)}");
}

// Text handler
with (oTextHandler) {
	print($"TextHandler state: {script_get_name(state)}");
}
