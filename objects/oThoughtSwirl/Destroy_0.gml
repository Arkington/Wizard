/// @desc Kill thought textboxes
for (var i = 0; i < n_thoughts; i++) {
	instance_destroy(thought_textboxes[i]);
}