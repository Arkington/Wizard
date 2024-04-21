if (instance_number(oCore) > 1) { instance_destroy(); }
sprite = sAxelHat;
state = CoreStateFree;

atk_hover = NONE;
time_in_state = 0;
hover_time = 0;

x_speed = 0;
y_speed = 0;
key = {};

angle = 90;
aim_lock = false;
aim_reset_timer = 0;