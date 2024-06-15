/// @desc Loads a test wave
if (live_call()) return live_result;

test_wave = oWaveSkullsSpaceInvaders;

// Stuff and stuff
global.wave_test = Battle(
	oOpponentSkull,
	oBackgroundStarRise,
	musNoMusicFound,
	5,
	function() { return test_wave; },
	EventBattleBreak,
	EventBattleBreak,
	EventBattleBreak
)
LoadBattle("wave_test");