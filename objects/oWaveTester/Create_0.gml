/// @desc Loads a test wave
test_wave = oWaveSkullsHorizontal;

// Stuff and stuff
global.wave_test = Battle(
	oOpponentSkull,
	5,
	function() { return test_wave; },
	EventBattleBreak
)
LoadBattle("wave_test");