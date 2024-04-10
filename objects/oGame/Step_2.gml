/// @desc Debug output
if !global.debug { exit; }


// Player
if instance_exists(oPlayer) {
	with oPlayer {
		switch state {
			case PlayerStateFree:
				show_debug_message("Player state Free");
				break;
			case PlayerStateCutscene:
				show_debug_message("Player state Cutscene");
				break;
			case PlayerStateSitting:
				show_debug_message("Player state Sitting");
				break;
			default:
				show_debug_message("Player state UNKNOWN");
				break;
		}
	}
}
