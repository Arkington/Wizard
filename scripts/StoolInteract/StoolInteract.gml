/// @desc Interact with a stool. Approach it from any direction and sit down any direction.
function StoolInteract(_stool) {
	
	var _stool_midpt_x = mean(_stool.bbox_left, _stool.bbox_right);
	var _stool_midpt_y = mean(_stool.bbox_top, _stool.bbox_bottom);
	
	oPlayer.state = PlayerStateCutscene;
	EventDepthAdj(oPlayer, SITTING_DEPTH_ADJ);

	// Identify which side we're on
	if (floor(oPlayer.bbox_bottom) >= floor(_stool.bbox_top)) {
		// Top
		EventMove(oPlayer, _stool_midpt_x, NONE);
	} else if (floor(oPlayer.bbox_top) <= floor(_stool.bbox_bottom)) {
		// Bottom
		EventMove(oPlayer, _stool_midpt_x, NONE);
	} else if (floor(oPlayer.bbox_right) <= floor(_stool.bbox_left)) {
		// Left
		EventMove(oPlayer, NONE, _stool_midpt_y);
	} else if (floor(oPlayer.bbox_left) >= floor(_stool.bbox_right)) {
		// Right
		EventMove(oPlayer, NONE, _stool_midpt_y);
	} else {
		show_debug_message("This stool is impossible to sit on!");
	}
	
	WaitForEvents();
	EventMove(oPlayer, _stool_midpt_x, _stool_midpt_y);
	
	// Face a particular direction if applicable
	EventWait(0.5);
	if (_stool.stool_face != NONE) {
		EventFace(oPlayer, _stool.stool_face );
	}
	EventSound(sndMenuSelect);
	EventPlayerState(PlayerStateSitting);
	oPlayer.sitting_on = _stool;
}