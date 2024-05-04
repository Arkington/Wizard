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
waves_cleared = []; // Tracks which waves have been cleared
waves_failed = []; // Tracks which waves have been failed
n_wins = 0;
n_fails = 0;
last_wave = NONE;
last_wave_win = false;
n_waves = 0;


// TEMPORARY, until we set up globals
atk_select = UP;
attacks = [
    SoulFlame,
    StunShock,
    Grapes
];
