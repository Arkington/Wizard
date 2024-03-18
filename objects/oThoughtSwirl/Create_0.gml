state = ThoughtSwirlStateWaiting;
thought_swirl = variable_global_get(thought_swirl_name);
key = {};

n_thoughts = 0;
struct_foreach(thought_swirl, function(_thought, _textnode) {
    thought_textboxes[n_thoughts] = create_thought_textbox(_thought);
    thoughts[n_thoughts] = _thought;
	thought_scales[n_thoughts] = THOUGHT_TEXT_SCALE;
    n_thoughts++;
});

lifetime = 0;
alpha = 0;
aim_lock = false;
aim_reset_timer = 0;
angle = 90;
thought_angles = [];
hover_thought = NONE;
for (var i = 0; i < n_thoughts; i++) {
    thought_angles[i] = 360 * i / n_thoughts;
}
