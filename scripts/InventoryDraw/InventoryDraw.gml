

function InvDrawMainWindow() {
	if (live_call()) return live_result;
	


	// Lowlighted tabs
	for (var i = 0; i < INV_N_TABS; i++) {
		if (i == tab) { continue; }
	
		draw_sprite_stretched(
			sInvTabLowlighted,
			i,
			x + tab_x[i],
			y - tab_h,
			tab_widths[i],
			tab_text_height + 2*INV_TAB_TEXT_BUFFER_Y + INV_BORDER_THICKNESS
		)
		draw_set_text(fntMagic, #BFBFBF, fa_left, fa_top);
		draw_text_border(
			x + tab_x[i] + INV_TAB_TEXT_BUFFER_X + INV_BORDER_THICKNESS,
			y - tab_text_height + INV_BORDER_THICKNESS,
			tab_text[i]
		)
	}

	// Main window
	draw_sprite_stretched(
		sInvWindowMain,
		0,
		x,
		y,
		inv_w,
		inv_h
	)


	// Highlighted tabs
	for (var i = 0; i < INV_N_TABS; i++) {
		if (i != tab) { continue; }
	
		draw_sprite_stretched(
			sInvTabHighlighted,
			i,
			x + tab_x[i],
			y - tab_h,
			tab_widths[i],
			tab_text_height + INV_TAB_TEXT_BUFFER_Y + INV_BORDER_THICKNESS
		)
		draw_set_text(fntMagic, WHITE, fa_left, fa_top);
		draw_text_border(
			x + tab_x[i] + INV_TAB_TEXT_BUFFER_X + INV_BORDER_THICKNESS,
			y - tab_text_height + INV_BORDER_THICKNESS + INV_HIGHLIGHTED_TAB_Y_ADJ,
			tab_text[i]
		)
	
	}


	// Selector - on tabs
	for (var i = 0; i < INV_N_TABS; i++) {
		if (selector.loc == INV_SELECTOR_LOC.TABS and selector.pos == i) {
			InvSelectorUpdateCoords(x + tab_x[i], y - tab_h + 1, tab_widths[i], tab_h + 3);
		}
	}


	// Inventory slots
	var _item_slot = 0;
	for (var j = 0; j < INV_N_ROWS; j++) {
		for (var i = 0; i < INV_N_COLS; i++) {
		
			var _slot_x = x + INV_BORDER_THICKNESS + excess/2 + i*(slot_w + INV_SLOT_BUFFER);
			var _slot_y = y + INV_BORDER_THICKNESS + INV_SLOTS_V_BUFFER + INV_SLOT_BUFFER + j*(slot_h + INV_SLOT_BUFFER);
		
			// Slot
			draw_sprite(
				sInvSlot,
				0,
				_slot_x,
				_slot_y
			)
			// Item
			if (n_items > _item_slot) {
				DrawItem(
					items[_item_slot],
					_slot_x + item_offset,
					_slot_y + item_offset
				)
			}
		
			// Selector
			if (selector.loc == INV_SELECTOR_LOC.MAIN and selector.pos == _item_slot) {
				InvSelectorUpdateCoords(_slot_x, _slot_y, slot_w, slot_h);
			}
		
			_item_slot++;
		}
	}
}





function InvDrawInfoWindow() {
	if (live_call()) return live_result;
	
	
	// Window
	draw_sprite_stretched(
		sInvWindowMain,
		0,
		x + info_x,
		y + info_y,
		info_w,
		info_h
	)
	// Heading
	draw_sprite_stretched(
		sInvWindowInfoHeading,
		0,
		x + info_x,
		y + info_y,
		info_w,
		info_heading_h
	)
	// Slot
	draw_sprite(
		sInvInfoSlot,
		0,
		x + info_slot_x,
		y + info_slot_y
	)
	// Textbox
	draw_sprite_stretched(
		sInvInfoTextbox,
		0,
		x + info_textbox_x,
		y + info_textbox_y,
		info_textbox_w,
		info_textbox_h
	)

	// Info tab item highlight
	if (item_select != NONE) {
		var _item = items[item_select];
	
		// Name
		draw_set_halign(fa_center);
		draw_text_border(
			x + info_item_name_x,
			y + info_item_name_y,
			_item.name
		)
	
		// Image
		DrawItem(
			_item,
			x + info_slot_x + 4,
			y + info_slot_y + 4,
			true,
			1.5
		)
	
		// Description
		draw_set_text(fntLittlePixels);
		draw_text_edge_ext(
			x + info_item_desc_x,
			y + info_item_desc_y,
			_item.desc_1,
			FNT_SEP_LITTLE_PIXELS,
			info_item_desc_w,
			1,
			0,
			WHITE,
			1
		)
		var _desc_1_h = string_height_ext(_item.desc_1, FNT_SEP_LITTLE_PIXELS, info_item_desc_w);
		if (selector.loc == INV_SELECTOR_LOC.INFO) {
			
			for (var i = 0; i < INV_N_INFO_BUTTONS; i++) {
				
				var _info_buttons_y = y + info_textbox_y + info_textbox_h - info_buttons_h - 3;
				
				// Draw button
				draw_sprite_stretched(
					info_buttons_sprite[i],
					0,
					x + info_buttons_x[i],
					_info_buttons_y,
					info_buttons_w[i],
					info_buttons_h
				)
				
				// Update selector
				if (selector.info_pos == i) {
					InvSelectorUpdateCoords(
						x + info_buttons_x[i] - 1,
						_info_buttons_y - 1,
						info_buttons_w[i] + 2,
						info_buttons_h + 2
					);
				}
			}
		} else {
			draw_text_edge_ext(
				x + info_item_desc_x,
				y + info_item_desc_y + _desc_1_h,
				_item.desc_2,
				FNT_SEP_LITTLE_PIXELS,
				info_item_desc_w,
				1,
				0,
				WHITE,
				1
			)		
		}
		
	}
}


function InvDrawEquipWindow() {
	if (live_call()) return live_result;

	
	// Window
	draw_sprite_stretched(
		sInvWindowEquip,
		0,
		x + equip_x,
		y + equip_y,
		equip_w,
		equip_h
	)
	// Heading
	draw_sprite_stretched(
		sInvWindowEquipHeading,
		0,
		x + equip_x,
		y + equip_y,
		equip_w,
		equip_heading_h
	)
	// Player name
	draw_set_text(fntMagic);
	draw_text_border(
		x + name_x,
		y + name_y,
		name
	)
	
	// Equip slots
	for (var i = 0; i < INV_N_EQUIP_SLOTS; i++) {
	
		var _equip_slot_x = x + equip_x + i*(equip_slot_w + INV_EQUIP_SLOT_OFFSET) + INV_EQUIP_SLOT_OFFSET + INV_BORDER_THICKNESS;
		var _equip_slot_y = y + equip_y + equip_heading_h + INV_EQUIP_SLOT_OFFSET;
	
		draw_sprite(
			sInvEquipSlot,
			0,
			_equip_slot_x,
			_equip_slot_y
		)
	
		// Selector - equip slots
		if (selector.loc == INV_SELECTOR_LOC.EQUIP and selector.pos == i) {
			InvSelectorUpdateCoords(_equip_slot_x, _equip_slot_y, equip_slot_w, equip_slot_h);
		}
	}

	// Back button
	var _back_x = x + equip_x + equip_w - back_w - INV_BORDER_THICKNESS - INV_EQUIP_SLOT_OFFSET;
	var _back_y = y + equip_y + equip_h - back_h - INV_BORDER_THICKNESS - INV_EQUIP_SLOT_OFFSET;
	draw_sprite(
		sInvBack,
		0,
		_back_x,
		_back_y
	)
	// Selector - back button
	if (selector.loc == INV_SELECTOR_LOC.EQUIP and selector.pos == 3) {
		InvSelectorUpdateCoords(_back_x - 2, _back_y - 2, back_w + 4, back_h + 4);
	}
}