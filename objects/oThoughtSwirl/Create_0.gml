lifetime = 0;
thoughts = [];
thought_swirl = variable_global_get(thought_swirl_name);
textnodes = [];
key = {};

// var n = 0;
// struct_foreach({thought_swirl}, function(_thought, _textnode) {
//     if (n < MAX_THOUGHTS) {
//         thoughts[n] = _thought;
//         textnodes[n] = _textnode;
//     }
//     n++;
// });

// TODO: make macro:
rotate_speed = 1;
thought_radius = 32;
n_thoughts = 7;

aim_lock = false;
aim_reset_timer = 0;
angle = 90;
thought_angles = [];
hover_thought = NONE;
for (var i = 0; i < n_thoughts; i++) {
    thought_angles[i] = 360 * i / n_thoughts;
}
