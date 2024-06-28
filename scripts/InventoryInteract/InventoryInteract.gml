/// @desc Interact with the inventory. Run inside oInvSelector.
function InvInteract(inv) {
	if (live_call()) return live_result;
	
	switch (loc) {
		
		// Change tabs
		case INV_SELECTOR_LOC.TABS:
			inv.tab = pos;
			break;
		
		// Move to info menu
		case INV_SELECTOR_LOC.MAIN:
			InvInteractMain();
			break;

		// Info buttons
		case INV_SELECTOR_LOC.INFO:
		
			// Initialize move mode
			if (info_pos == 0) {
				state = InvSelectorStateGrabPrep;
			} else {
				loc = INV_SELECTOR_LOC.MAIN;
			}
			break;

		case INV_SELECTOR_LOC.EQUIP:
			break;
	}
}


function InvInteractMain() {
	if (live_call()) return live_result;
	
	
	// Nothing held, bring up info menu
	if (held_item == NONE) {
		progress = 0;
		if (pos < inv.n_items) {
			loc = INV_SELECTOR_LOC.INFO;
			info_pos = 0;
		}
	} else {
		// Item held. Are we on a free spot?
		if (pos >= inv.n_items or inv.items[pos] == NONE) {
			// Yes
			state = InvSelectorStatePlaceItem;
		} else {
			// No
			swap_in_item = inv.items[pos];
			swap_out_item = held_item;
			inv.items[pos] = NONE;
			held_item = NONE;
			state = InvSelectorStateSwapItem;
		}
	}
}