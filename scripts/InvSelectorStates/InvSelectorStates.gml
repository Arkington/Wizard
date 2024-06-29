


function InvSelectorStateFree() {
	if (live_call()) return live_result;

	var _up = (key.up - key.down > 0);
	var _down = (key.up - key.down < 0);
	var _left = (key.left - key.right > 0);
	var _right = (key.left - key.right < 0);


	// Movement or Interact
	if (_up or _down or _left or _right) {
		double_tap = false;

		// Double tap checks
		if (keyboard_key == last_key and double_tap_timer > 0) {
			double_tap = true;
		}
		last_key = keyboard_key;
		double_tap_timer = INV_SELECTOR_DOUBLE_TAP_TIMER;



		// SFX
		audio_play_sound(sndMenuMove, 0, false);
		
	} else if (key.interact) {
		InvInteract(oInventory);
		audio_play_sound(sndMenuSelect, 0, false);
	}

	// Smooth move (must be after interact)
	if (_up or _down or _left or _right or key.interact) {
		progress = 0;
	
		// Update position
		InvSelectorUpdatePos(_up, _down, _left, _right);
		var _ignore_wh = (held_item != NONE or swap_in_item != NONE);
		InvSelectorUpdateTargets(_ignore_wh);

	}

	// Offset if neeeded
	if (loc == INV_SELECTOR_LOC.MAIN and x_offset > 0) {
		x_offset = (slot_w - w)/2;
		y_offset = (slot_h - h)/2;
	} else {
		x_offset = 0;
		y_offset = 0;
	}
}








function InvSelectorStatePlaceItem() {
	if (live_call()) return live_result;

	image_speed = 0;
	z = max(z - 1, 0);
	if (z == 0) {
		inv.items[pos] = held_item;
		held_item = NONE;
		w = INV_SELECTOR_MIN_SIZE + 1;
		h = INV_SELECTOR_MIN_SIZE + 1;
		InvSelectorUpdateTargets();
		progress = 0;
		sprite_index = sInvSelector;
		image_speed = 1;
		// Offset sprite
		x_offset = (slot_w - w)/2;
		y_offset = (slot_h - h)/2;
		state = InvSelectorStateFree;
	}
	
	// TODO: interrupt condition
}

function InvSelectorStateSwapItem() {
 	if (live_call()) return live_result;

	swap_progress += 1/(INV_SWAP_TIME_S*FPS);
	if (swap_progress >= 1) {
		held_item = swap_in_item;
		inv.items[pos] = swap_out_item;
		swap_in_item = NONE;
		swap_out_item = NONE;
		swap_progress = 0;
		state = InvSelectorStateFree;
	}
	
	// TODO: interrupt condition
}


// Wait until we are at the right position to start grab animation
function InvSelectorStateGrabPrep() {
	if (live_call()) return live_result;

	loc = INV_SELECTOR_LOC.MAIN;
	
	// Interpolate position
	InvSelectorUpdateTargets();
	InvSelectorSmoothMove();

	if (progress == 1) {
		progress = 0;
		held_item = inv.items[pos];
		inv.items[pos] = NONE;
		image_index = image_index % 2; // Ensure we are on the bigger selector frame
		image_speed = 0;
		state = InvSelectorStateGrab;
	}
}

// Grab animation with selector closing in on the item
function InvSelectorStateGrab() {
	if (live_call()) return live_result;

	// Interpolate width
	w = progress*INV_SELECTOR_MIN_SIZE + (1 - progress)*old_w;
	h = progress*INV_SELECTOR_MIN_SIZE + (1 - progress)*old_w;

	// Offset sprite
	x_offset = (slot_w - w)/2;
	y_offset = (slot_h - h)/2;

	// Move to lift phase
	if (w < INV_SELECTOR_MIN_SIZE + 1) {
		sprite_index = sInvSelectorArrow;
		w = sprite_height;
		h = sprite_width;
		tar_w = sprite_width;
		tar_h = sprite_height;
		x_offset = item_offset; // TODO: more flexible
		y_offset = item_offset;
		state = InvSelectorStateLift;
	}
	
	// TODO: interrupt condition

}

function InvSelectorStateLift() {
	if (live_call()) return live_result;

	
	z = min(z + 1, INV_SELECTOR_GRAB_HEIGHT);
	if (z == INV_SELECTOR_GRAB_HEIGHT) {
		image_speed = 1;
		state = InvSelectorStateFree;
	}
	
	// TODO: interrupt condition

}
