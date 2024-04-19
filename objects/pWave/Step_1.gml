/// @desc Battle timer and clear condition

// Fail condition
timer--;
if (timer < 0) {
	over = true;
}

// Clear condition - set clear to true
clear = true;
var _clear_enemies = struct_get_names(get_em);
for (var i = 0; i < array_length(_clear_enemies); i++) {
	if (struct_get(get_em, _clear_enemies[i]) > 0) {
		clear = false;
	}
}
over = over or clear;