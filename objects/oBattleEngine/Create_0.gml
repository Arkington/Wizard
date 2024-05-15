state = BattleEngineStateAwaiting;

// Battle system features
battle_struct = NONE;
opponent = NONE;
hp_bar = NONE;
attack_ui = NONE;
meter = NONE;
get_em = NONE;
bullet_box = NONE;

// Loaded 
wave_goal = NONE;
NextWave = NONE;
NextEvent = NONE;

// Battle tracking variables
current_wave = NONE;
battle_info = {};
waves_cleared = []; // Which waves have been cleared
waves_failed = []; // Which waves have been failed
n_wins = 0;
n_fails = 0;
last_wave = NONE;
last_wave_win = false;
n_waves = 0;
victory = false;

// Engine variables
state_prev = NONE;
time_in_state = 0;

// Break buttons
buttons = [BUTTON_READY, BUTTON_THINK, BUTTON_ITEM];
