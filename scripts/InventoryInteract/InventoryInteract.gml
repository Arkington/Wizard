/// @desc Interact with the inventory
function InventoryInteract(_inv) {
	if (live_call()) return live_result;
	
	switch (loc) {
		case INV_SELECTOR_LOC.TABS:
			_inv.tab = pos;
			break;

		case INV_SELECTOR_LOC.MAIN:
			if (pos < _inv.n_items) {
				loc = INV_SELECTOR_LOC.INFO;
				info_pos = 0;
			}
			break;

		case INV_SELECTOR_LOC.INFO:
			loc = INV_SELECTOR_LOC.MAIN;
			break;

		case INV_SELECTOR_LOC.EQUIP:
			break;
	}
}



