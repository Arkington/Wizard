 /// @desc Battle timer and clear condition

// Fail condition

//if random(100) < 2 print("I disabled the wave timer");
timer--;
if (timer < 0) {
	over = true;
}

// Clear condition - set clear to true
clear = true;
var _clear_enemies = struct_get_names(clear_condition_progress);
for (var i = 0; i < array_length(_clear_enemies); i++) {
	if (struct_get(clear_condition_progress, _clear_enemies[i]) > 0) {
		clear = false;
	}
}
over = over or clear;