
// Selector locations - the selector could be in any one of these inventory windows
enum INV_SELECTOR_LOC {
	TABS, // 0..2
	MAIN, // 0..15
	EQUIP, // 0..4
	INFO // 0..3
}


/// @desc Run from oInvSelector.
function InvSelectorGetTargets() {
	if (live_call()) return live_result;

	with (inv) {

		switch(other.loc) {
			case INV_SELECTOR_LOC.TABS:
				return [
					tab_x[other.pos],
					tab_y,
					tab_widths[other.pos],
					tab_h
				]
				
			case INV_SELECTOR_LOC.MAIN:
				return [
					slot_x[other.pos],
					slot_y[other.pos],
					slot_w,
					slot_h
				]
				
			case INV_SELECTOR_LOC.INFO:
				return [
					info_buttons_x[other.info_pos] - 1,
					info_buttons_y - 1,
					info_buttons_w[other.info_pos] + 2,
					info_buttons_h + 2
				]
				
			case INV_SELECTOR_LOC.EQUIP:
				if (other.pos != 3) {
					return [
						equip_slot_x[other.pos],
						equip_slot_y,
						equip_slot_w,
						equip_slot_h
					
					]
				} else {
					return [
						back_x - 2,
						back_y - 2,
						back_w + 4,
						back_h + 4
					]
				}				
		}
	}
}

/// @desc Runs InvSelectorGetTargets() and then updates them. Run from oInvSelector.
function InvSelectorUpdateTargets(_ignore_wh = false) {
	
	var _targets = InvSelectorGetTargets();
	_x = _targets[0];
	_y = _targets[1];
	_w = _targets[2];
	_h = _targets[3];

	// Update condition
	old_x = x;
	old_y = y;
	if (!_ignore_wh) {
		old_w = w;
		old_h = h;
	}
		
	tar_x = _x;
	tar_y = _y;
	if (!_ignore_wh) {
		tar_w = _w;
		tar_h = _h;
	}


}


function InvSelectorSmoothMove(_ignore_wh = false) {
	x = progress*tar_x + (1 - progress)*old_x;
	y = progress*tar_y + (1 - progress)*old_y;
	if (!_ignore_wh) {
		w = progress*tar_w + (1 - progress)*old_w;
		h = progress*tar_h + (1 - progress)*old_h;
	}
}

function InvSelectorUpdatePos(_up, _down, _left, _right) {

	// First deal with shortcuts
	if (_up and key.shift) or (_up and double_tap) {
		for (var i = 0; i < INV_N_ROWS + 1; i++) {
			InvSelectorUpdatePosMainLogic(true, false, false, false, false, false);
		}
		return;
	} else if (_down and key.shift) or (_down and double_tap) {
		for (var i = 0; i < INV_N_ROWS + 1; i++) {
			InvSelectorUpdatePosMainLogic(false, true, false, false, false, false);
		}
		return;
	} else if (_left and key.shift) or (_left and double_tap) {
		for (var i = 0; i < INV_N_COLS; i++) {
			InvSelectorUpdatePosMainLogic(false, false, true, false, false, false);
		}
		return;
	} else if (_right and key.shift) or (_right and double_tap) {
		for (var i = 0; i < INV_N_COLS; i++) {
			InvSelectorUpdatePosMainLogic(false, false, false, true, false, false);
		}
		return;
	}

	// Main logic
	InvSelectorUpdatePosMainLogic(_up, _down, _left, _right);
}

// @desc vwrap allows us to wrap-around the menu vertically.
// @desc We need the ability to turn this off for the sake of shortcuts.
function InvSelectorUpdatePosMainLogic(_up, _down, _left, _right, _hwrap = true, _vwrap = true) {
	switch (loc) {
		case INV_SELECTOR_LOC.TABS:
			InvSelectorUpdatePosTabs(_up, _down, _left, _right, _hwrap, _vwrap);
			break;
		case INV_SELECTOR_LOC.MAIN:
			InvSelectorUpdatePosMain(_up, _down, _left, _right, _hwrap);
			break;
		case INV_SELECTOR_LOC.INFO:
			InvSelectorUpdatePosInfo(_up, _down, _left, _right, _hwrap);
			break;
		case INV_SELECTOR_LOC.EQUIP:
			InvSelectorUpdatePosEquip(_up, _down, _left, _right, _hwrap, _vwrap);
			break;
	}
}

function InvSelectorUpdatePosTabs(_up, _down, _left, _right, _hwrap = true, _vwrap = true) {
	// Moving up
	if (_up and _vwrap) {
		loc = INV_SELECTOR_LOC.EQUIP;
		if (pos == 0) { pos = 0; }
		else if (pos == 1) { pos = 2; }
		else { pos = 3; }
		return;
	}
	
	// Moving down
	if (_down) {
		loc = INV_SELECTOR_LOC.MAIN;
		if (pos == 0) { pos = 0; }
		else if (pos == 1) { pos = 2; }
		else { pos = 4; }
		return;
	}
	
	// LR
	pos += _right - _left;
	if (_hwrap) {
		pos = (pos + INV_N_TABS) % INV_N_TABS; // Loop around
	} else {
		pos = clamp(pos, 0, INV_N_TABS - 1);
	}
}

function InvSelectorUpdatePosMain(_up, _down, _left, _right, _hwrap = true) {
	var _row = pos div INV_N_COLS;
	var _col = pos mod INV_N_COLS;
	
	// Moving to tabs
	if (_row == 0 and _up) {
		loc = INV_SELECTOR_LOC.TABS;
		if (_col <= 1) { pos = 0; }
		else if (_col <= 3) { pos = 1; }
		else { pos = 2; }
		return;
	}

	// Moving to equip
	if (_row == INV_N_ROWS - 1 and _down) {
		loc = INV_SELECTOR_LOC.EQUIP;
		if (_col == 0) { pos = 0; }
		else if (_col == 1) { pos = 1; }
		else if (_col <= 3) { pos = 2; }
		else { pos = 3; }
		return;
	}

	// Moving in main	
	_row += _down - _up;
	_col += _right - _left;
	if (_hwrap) {
		_col = (_col + INV_N_COLS) % INV_N_COLS; // Loop around
	} else {
		_col = clamp(_col, 0, INV_N_COLS - 1);
	}

	pos = _row*INV_N_COLS + _col;

}

function InvSelectorUpdatePosInfo(_up, _down, _left, _right, _hwrap = true) {
	info_pos += _right - _left;
	if (_hwrap) {
		info_pos = (info_pos + INV_N_INFO_BUTTONS) % INV_N_INFO_BUTTONS; // Loop around
	} else {
		info_pos = clamp(info_pos, 0, INV_N_INFO_BUTTONS - 1);
	}
}

function InvSelectorUpdatePosEquip(_up, _down, _left, _right, _hwrap = true, _vwrap = true) {
	
	// Moving up
	if (_up) {
		loc = INV_SELECTOR_LOC.MAIN;
		if (pos == 0) { pos = 10; }
		else if (pos == 1) { pos = 11; }
		else if (pos == 2) { pos = 12; }
		else { pos = 14; }
		return;
	}
	
	// Moving down
	if (_down and _vwrap) {
		loc = INV_SELECTOR_LOC.TABS;
		if (pos <= 1) { pos = 0; }
		else if (pos == 2) { pos = 1; }
		else { pos = 2; }
		return;
	}
	
	// LR
	pos += _right - _left;
	if (_hwrap) {
		pos = (pos + INV_N_EQUIP_SLOTS + 1) % (INV_N_EQUIP_SLOTS + 1); // Loop around
	} else {
		pos = clamp(pos, 0, INV_N_EQUIP_SLOTS);
	}
}
