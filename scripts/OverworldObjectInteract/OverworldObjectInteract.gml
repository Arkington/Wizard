/// @desc

// Let's start by writing this assuming the bench is facing right
function BenchInteract(_bench) {
	var _bench_midpt_x = mean(_bench.bbox_left, _bench.bbox_right);
	var _bench_midpt_y = mean(_bench.bbox_top, _bench.bbox_bottom);
	var _bench_face = round(_bench.image_angle/90)%4;
	var _bench_approach = [
		BenchApproachRight,
		BenchApproachUp,
		BenchApproachLeft,
		BenchApproachDown
	]
	
	oPlayer.state = PlayerStateCutscene;
	
	// Approach the bench
	script_execute(_bench_approach[_bench_face], _bench, _bench_midpt_x, _bench_midpt_y);
	
	// Sit down
	EventWait(0.5);
	EventFace(oPlayer, _bench_face);
	EventSound(sndMenuSelect);
	EventPlayerState(PlayerStateSitting);
}




function BenchApproachRight(_bench, _bench_midpt_x, _bench_midpt_y) {

	// If we are behind the bench:
	if (floor(oPlayer.bbox_right) <= floor(_bench.bbox_left)) {
		if (oPlayer.y < _bench_midpt_y) {
			// Walk up
			EventMove(oPlayer, NONE, _bench.bbox_top + y - oPlayer.bbox_bottom);
		} else {
			// Walk down
			EventMove(oPlayer, NONE, _bench.bbox_bottom + y - oPlayer.bbox_top);
		}
		WaitForEvents();
	}

	// If we aren't in front of the bench
	if (floor(oPlayer.bbox_left) < floor(_bench.bbox_right)) {
		EventMove(oPlayer, _bench.bbox_right + x - oPlayer.bbox_left, NONE);
		WaitForEvents();
	}
	
	// Now move to bench center
	EventMove(oPlayer, NONE, _bench_midpt_y);
	WaitForEvents();

	// Sit down
	EventDepthAdj(oPlayer, SITTING_DEPTH_ADJ);
	EventMove(oPlayer, _bench_midpt_x + SITTING_DISTANCE, _bench_midpt_y);
}

function BenchApproachLeft(_bench, _bench_midpt_x, _bench_midpt_y) {

	// If we are behind the bench:
	if (ceil(oPlayer.bbox_left) >= ceil(_bench.bbox_right)) {
		if (oPlayer.y < _bench_midpt_y) {
			// Walk up
			EventMove(oPlayer, NONE, _bench.bbox_top + y - oPlayer.bbox_bottom);
		} else {
			// Walk down
			EventMove(oPlayer, NONE, _bench.bbox_bottom + y - oPlayer.bbox_top);
		}
		WaitForEvents();
	}
	
	// If we aren't in front of the bench
	if (ceil(oPlayer.bbox_right) > ceil(_bench.bbox_left)) {
		EventMove(oPlayer, _bench.bbox_left + x - oPlayer.bbox_right, NONE);
		WaitForEvents();
	}
	
	// Now move to bench center
	EventMove(oPlayer, NONE, _bench_midpt_y);
	WaitForEvents();

	// Sit down
	EventDepthAdj(oPlayer, SITTING_DEPTH_ADJ);
	EventMove(oPlayer, _bench_midpt_x - SITTING_DISTANCE, _bench_midpt_y);
}

function BenchApproachDown(_bench, _bench_midpt_x, _bench_midpt_y) {

	// If we are behind the bench:
	if (floor(oPlayer.bbox_bottom) <= floor(_bench.bbox_top)) {
		if (oPlayer.x < _bench_midpt_x) {
			// Walk left
			EventMove(oPlayer, _bench.bbox_left + x - oPlayer.bbox_right, NONE);
		} else {
			// Walk right
			EventMove(oPlayer, _bench.bbox_right + x - oPlayer.bbox_left, NONE);
		}
		WaitForEvents();
	}

	// If we aren't in front of the bench
	if (floor(oPlayer.bbox_top) < floor(_bench.bbox_bottom)) {
		EventMove(oPlayer, NONE, _bench.bbox_bottom + y - oPlayer.bbox_top);
		WaitForEvents();
	}
	
	// Now move to bench center
	EventMove(oPlayer, _bench_midpt_x, NONE);
	WaitForEvents();

	// Sit down
	EventDepthAdj(oPlayer, SITTING_DEPTH_ADJ);
	EventMove(oPlayer, _bench_midpt_x, _bench_midpt_y + SITTING_DISTANCE);
}

function BenchApproachUp(_bench, _bench_midpt_x, _bench_midpt_y) {

	// If we are behind the bench:
	if (ceil(oPlayer.bbox_top) >= ceil(_bench.bbox_bottom)) {
		if (oPlayer.x < _bench_midpt_x) {
			// Walk left
			EventMove(oPlayer, _bench.bbox_left + x - oPlayer.bbox_right, NONE);
		} else {
			// Walk right
			EventMove(oPlayer, _bench.bbox_right + x - oPlayer.bbox_left, NONE);
		}
		WaitForEvents();
	}

	// If we aren't in front of the bench
	if (ceil(oPlayer.bbox_bottom) > ceil(_bench.bbox_top)) {
		EventMove(oPlayer, NONE, _bench.bbox_top + y - oPlayer.bbox_bottom);
		WaitForEvents();
	}
	
	// Now move to bench center
	EventMove(oPlayer, _bench_midpt_x, NONE);
	WaitForEvents();

	// Sit down
	EventDepthAdj(oPlayer, SITTING_DEPTH_ADJ);
	EventMove(oPlayer, _bench_midpt_x, _bench_midpt_y - SITTING_DISTANCE);
}
