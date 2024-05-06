if (instance_number(oCore) > 1) { instance_destroy(); }

// Core data
sprite = sAxelHat;
state = CoreStateFree;
state_prev = NONE;
atk_hover = NONE;
time_in_state = 0;
hover_time = 0;

x_speed = 0;
y_speed = 0;
key = {};

angle = 90;
aim_lock = false;
aim_reset_timer = 0;
focus_release_timer = 0;

// Active battle data
attacks = global.attacks;
cooldowns = [0, 0, 0];
atk_select = UP;

// Break buttons
buttons = [0, 1, 2, 3];
n_buttons = array_length(buttons);
for (var i = 0; i < n_buttons; i++) {
	button_angles[i] = 90 + 360*i/n_buttons;
}
button_hover = NONE;