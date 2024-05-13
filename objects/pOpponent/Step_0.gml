/// @desc

// Fade out/in
if (
	global.battle_engine.state == BattleEngineStateWave or
	global.battle_engine.state == BattleEngineStateWaveCooloff
) {
	image_alpha = max(image_alpha - OPPONENT_FADE_SPEED, 0);
} else {
	image_alpha = min(image_alpha + OPPONENT_FADE_SPEED, 1);
}