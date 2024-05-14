/// @desc Standard battle transition
function EnterBattle(_battle_struct_name) {
	EventPlayerStateCutscene();
	BattleEngineStorePlayerPosition();
	EventJump(oPlayer);
	WaitForEvents();
	EventSound(sndAtkShift);
	EventCoreInit(168, 192);
	EventTransition(rParent);
	WaitForEvents();
	EventSound(sndAtkShift);
	EventWait(1);
	EventTransition(rBattleParent);
	WaitForEvents();
	EventCoreState(CoreStateFree);
	EventCode(function() { oCore.persistent = false; });
	EventCode(LoadBattle, [_battle_struct_name]);
}


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