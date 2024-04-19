state = BattleEngineStateAwaiting;

// Loaded 
wave_goal = NONE;
AfterWave = NONE;
NextWave = NONE;

// Bullet box
bb_top = 80;
bb_bottom = 120;
bb_left = 20;
bb_right = 80;

// Battle tracking variables
current_wave = NONE;
battle_info = {};
waves_cleared = []; // Tracks which waves have been cleared
waves_failed = []; // Tracks which waves have been failed
n_success = 0;
n_failure = 0;
