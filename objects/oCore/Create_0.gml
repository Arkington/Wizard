if (instance_number(oCore) > 1) { instance_destroy(); }

// Core data
sprite = sAxelHat;
state = CoreStateFree;
state_prev = NONE;
attack_hover = NONE;
time_in_state = 0;
hover_time = 0;
iframes = false;
iframes_time = 0;
powered_up = false; // Tracks the state of winning a battle

x_speed = 0;
y_speed = 0;
key = {};

angle = 90;
aim_lock = false;
aim_reset_timer = 0;
focus_release_timer = 0;

// Attacks
attacks = global.attacks;
n_attacks = array_length(global.attacks);
if (n_attacks <= 2) {
	for (var i = 0; i < n_attacks; i++) {
		attack_angles[i] = 180 + 360*i/n_attacks;
	}
} else {
	for (var i = 0; i < n_attacks; i++) {
		attack_angles[i] = 90 + 360*i/n_attacks;
	}
}
cooldowns = [0, 0, 0];
attack_scales = [1, 1, 1];
attack_select = UP;

// Break buttons
buttons = [BUTTON_READY, BUTTON_THINK, BUTTON_ITEM];
n_buttons = array_length(buttons);
for (var i = 0; i < n_buttons; i++) {
	button_angles[i] = 270 + 360*i/n_buttons;
}
button_scales = [1, 1, 1];
button_hover = NONE;