/// @desc Standard battle transition
function BattleTransition() {
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
}

/*
TODO:
	- Allow transitions to kill the player object