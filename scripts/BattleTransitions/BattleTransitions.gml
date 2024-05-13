/// @desc Standard battle transition
function EnterBattle(_battle_struct_name) {
	EventPlayerStateCutscene();
	BattleEngineStorePlayerPosition();
	EventJump(oPlayer);
	WaitForEvents();
	EventSound(sndAtkShift);
	EventCoreInit(168, 192);
	EventTransition(rParent, -LARGE, -LARGE, DOWN);
	WaitForEvents();
	EventSound(sndAtkShift);
	EventWait(1);
	EventTransition(rBattleParent, -LARGE, -LARGE, DOWN);
	WaitForEvents();
	EventCoreState(CoreStateFree);
	EventCode(function() { oCore.persistent = false; });
	EventCode(LoadBattle, [_battle_struct_name]);
}

/*
TODO:
	- Allow transitions to kill the player object
*/
function ExitBattle() {
	EventTransition(
		global.battle_engine.room_prev,
		global.battle_engine.x_prev,
		global.battle_engine.y_prev,
		global.battle_engine.face_prev
	);
	EventCode(EndBattle);
	EventPlayerStateFree(); // TODO: maybe script an event immediately following a battle...
}