/// @desc

// Fade out/in
if (
	global.battle_engine.state == BattleEngineStateBreak or
	global.battle_engine.state == BattleEngineStateCutscene
) {
	image_alpha = min(image_alpha + OPPONENT_FADE_SPEED, 1);
} else {
	image_alpha = max(image_alpha - OPPONENT_FADE_SPEED, 0);
}