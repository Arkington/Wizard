// Full-battle
#macro OOB_KILL_DIST 16


// Core
#macro CORE_INIT_X 168
#macro CORE_INIT_Y 192

#macro CORE_MOVE_SPEED 3
#macro CORE_ROTATE_SPEED 0.3
#macro CORE_IFRAMES_S 2
#macro CORE_IFRAMES_BLINK_FRAMES 3
#macro FOCUS_MOVE_SPEED CORE_MOVE_SPEED/2

#macro AIM_LOCK_FRAMES 5
#macro AIM_LOCK_FRAMES_FOCUS 15
#macro FOCUS_RELEASE_FRAMES 5
#macro ATTACK_RELEASE_FRAMES 5

#macro FOCUS_ATTACK_X_DIST 24
#macro FOCUS_ATTACK_Y_DIST 24
#macro HOVER_ATTACK_SCALE 2
#macro HOVER_ATTACK_SPEED 0.2

// Attacks
#macro ATTACK_DIR_VAR 2
#macro STUN_FRAMES 90

// Break buttons
#macro BUTTON_READY "Ready"
#macro BUTTON_GET_EM "|X||P|Get 'em!/P//X/"
#macro BUTTON_THINK "Think"
#macro BUTTON_ITEM "Item"
#macro BREAK_BUTTON_TEXT_SCALE (2/3)
#macro BREAK_BUTTON_WIDTH 40
#macro BREAK_BUTTON_HEIGHT 18
#macro BREAK_BUTTON_RADIUS 32
#macro BREAK_BUTTON_HOVER_SCALE 1.5
#macro BREAK_BUTTON_HOVER_SPEED 0.1

// Enemies
#macro ENEMY_DAMAGE_SHADER_S 0.5
#macro ENEMY_DIE_SHADER_S 0.3
#macro ENEMY_WARP_SHADER_S 0.35
#macro ENEMY_DOWN -1
#macro ENEMY_MAX_P 5
#macro ENEMY_BUMP_RADIUS 4
#macro ENEMY_BUMP_DIR_VAR 2
#macro ENEMY_BUMP_P 0.5

// Bullets
#macro BULLET_FIZZLE_S 0.3


// Engine
#macro COOLOFF_FRAMES_BETWEEN_CLEAR 4
#macro COOLOFF_MIN_TIME_S 1.2

// Bullet box
#macro BB_X 168
#macro BB_Y 184
#macro BB_W 216
#macro BB_H 56

// HP bar
#macro HP_X 16
#macro HP_Y 16
#macro HP_LEN 96
#macro HP_FREEZE_S 1
#macro HP_DRAIN_SPEED 0.2

// Meter
#macro METER_X 232
#macro METER_Y 16
#macro METER_LEN 80

// Opponent
#macro OPPONENT_Y 96
#macro OPPONENT_FADE_SPEED 0.05
#macro OPPONENT_HIT_DIR_VAR 30
#macro OPPONENT_MAGNET_FACTOR 1/20

// Get em
#macro GET_EM_X 24
#macro GET_EM_Y 48
#macro GET_EM_W 48
#macro GET_EM_H 56
#macro TIME_WARNING_S 5

// Game Over and Retry Menu
#macro DEATH_TEXT_Y 72
#macro GAME_OVER_Y 72
#macro GAME_OVER_FADE_IN_TIME 1.22448
#macro GAME_OVER_TIME_TO_BUTTONS_S 2.44897 // 1 bar of music
#macro RETRY_BUTTON_Y 112
#macro RETRY_BUTTON_FRAME_DELAY 8
#macro RETRY_BUTTON_ARMA_VAR 0.05
#macro RETRY_BUTTON_AR [0.8, 0.1, 0.07]
#macro RETRY_BUTTON_MA [1, 0.5, 0.2]
#macro RETRY_BUTTON_DRIFT_SHOCK_TIME_S 1
#macro RETRY_BUTTON_TEXT_SCALE (2/3)
#macro RETRY_BUTTON_WIDTH 36
#macro RETRY_BUTTON_HEIGHT 18
#macro RETRY_BUTTON_DIST 40
#macro RETRY_BUTTON_HOVER_SCALE 1.5
#macro RETRY_BUTTON_HOVER_SPEED 0.1

// Battle object constance
#macro POOF_CLOUD_Y_ADJ 5


// Technical constants
#macro FRAMES_BETWEEN_CLEAN 1*FPS