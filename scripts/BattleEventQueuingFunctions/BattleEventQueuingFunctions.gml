// Instant events (a normal function wrapped in an EventCode())

/// @desc Queue a player state change
function EventBattleBreak() {
	EventCode(
		function() { with (global.battle_engine) { BattleEngineShiftToBreak(); } }
	);
}
