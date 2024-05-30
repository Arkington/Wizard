 /// @desc Halting, battle timer, clear condition

if (halted) { exit; }

// Fail condition
t++;
timer--;
if (timer < 0) {
	over = true;
}

// Clear condition - set clear to true
var _condition_complete = true;
var _clear_enemies = struct_get_names(clear_condition_progress);
for (var i = 0; i < array_length(_clear_enemies); i++) {
	if (struct_get(clear_condition_progress, _clear_enemies[i]) > 0) {
		_condition_complete = false;
	}
}
clear = clear or (_condition_complete and !over);
over = over or clear;