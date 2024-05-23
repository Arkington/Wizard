/// @desc Loads a test wave

// Stuff and stuff
global.wave_test = Battle(
	oOpponentSkull,
	musNoMusicFound,
	5,
	function() { return BATTLE_TEST_WAVE; },
	EventBattleBreak,
	EventBattleBreak,
	EventBattleBreak
)
LoadBattle("wave_test");