/// @desc Loads a test wave

// Stuff and stuff
global.wave_test = Battle(
	oOpponentSkull,
	5,
	function() { return BATTLE_TEST_WAVE; },
	EventBattleBreak
)
LoadBattle("wave_test");