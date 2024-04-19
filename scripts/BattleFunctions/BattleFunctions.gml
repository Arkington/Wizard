/// @desc Creates Battle() structs.
function Battle(_wave_goal, _next_wave, _after_wave) {
	return {
		wave_goal : _wave_goal,
		NextWave : _next_wave,
		AfterWave : _after_wave,
	}
}

/// @desc Loads a Battle() struct into the BattleEngine.
function LoadBattle(_battle) {
	with (global.battle_engine) {
		wave_goal = _battle.wave_goal;
		NextWave = _battle.NextWave;
		AfterWave = _battle.AfterWave;
	}
}





// Testing
function nw() {
	if (n_success > 2) {
		return oWaveSkullJustSittingThere;
	} else {
		return oWaveTargetJustSittingThere;
	}
}

function aw() {
	global.battle_engine.state = BattleEngineStateBreak;
}

test_battle = Battle(5, nw, aw);
