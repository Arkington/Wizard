
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


	var _x;
	var _y;
	var _w;
	var _h;

	with (inv) {

		switch(other.loc) {
			case INV_SELECTOR_LOC.TABS:
				_x = x + tab_x[other.pos];
				_y = y - tab_h + 1;
				_w = tab_widths[other.pos];
				_h = tab_h + 3;
				break;
				
			case INV_SELECTOR_LOC.MAIN:
				_x = x + INV_BORDER_THICKNESS + excess/2 + (other.pos mod INV_N_COLS)*(slot_w + INV_SLOT_BUFFER);
				_y = y + INV_BORDER_THICKNESS + INV_SLOTS_V_BUFFER + INV_SLOT_BUFFER + (other.pos div INV_N_COLS)*(slot_h + INV_SLOT_BUFFER);
				_w = slot_w;
				_h = slot_h;
				break;
				
			case INV_SELECTOR_LOC.INFO:
				_x = x + info_buttons_x[other.info_pos] - 1;
				_y = y + info_textbox_y + info_textbox_h - info_buttons_h - 4;
				_w = info_buttons_w[other.info_pos] + 2;
				_h = info_buttons_h + 2;
				break;
				
			case INV_SELECTOR_LOC.EQUIP:
				if (other.pos != 3) {
					_x = x + equip_x + other.pos*(equip_slot_w + INV_EQUIP_SLOT_OFFSET) + INV_EQUIP_SLOT_OFFSET + INV_BORDER_THICKNESS;
					_y = y + equip_y + equip_heading_h + INV_EQUIP_SLOT_OFFSET;
					_w = equip_slot_w;
					_h = equip_slot_h;
				} else {
					_x = x + equip_x + equip_w - back_w - INV_BORDER_THICKNESS - INV_EQUIP_SLOT_OFFSET - 2;
					_y = y + equip_y + equip_h - back_h - INV_BORDER_THICKNESS - INV_EQUIP_SLOT_OFFSET - 2;
					_w = back_w + 4;
					_h = back_h + 4;
				}
				break;
				
		}
	}
	
	// Init condition
	return [_x, _y, _w, _h];
}

/// @desc Run from oInvSelector.
function InvSelectorUpdateTargets(_x, _y, _w, _h, _ignore_wh = false) {


	// Init condition
	if (w == 0 or h == 0) {
		old_x = _x;
		old_y = _y;
		old_w = _w;
		old_h = _h;
		
		tar_x = _x;
		tar_y = _y;
		tar_w = _w;
		tar_h = _h;
	}
		
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
