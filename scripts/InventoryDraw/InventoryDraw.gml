

function InvDrawMainWindow() {
	if (live_call()) return live_result;
	


	// Lowlighted tabs
	for (var i = 0; i < INV_N_TABS; i++) {
		if (i == tab) { continue; }
	
		draw_sprite_stretched(
			sInvTabLowlighted,
			i,
			tab_x[i],
			tab_y,
			tab_widths[i],
			tab_h
		)
		draw_set_text(fntMagic, #BFBFBF, fa_left, fa_top);
		draw_text_border(
			tab_text_x[i],
			tab_text_y,
			tab_text[i]
		)
	}

	// Main window
	draw_sprite_stretched(
		sInvWindowMain,
		0,
		main_x,
		main_y,
		inv_w,
		inv_h
	)

	// Highlighted tabs
	for (var i = 0; i < INV_N_TABS; i++) {
		if (i != tab) { continue; }
	
		draw_sprite_stretched(
			sInvTabHighlighted,
			i,
			tab_x[i],
			tab_y,
			tab_widths[i],
			tab_h
		)
		draw_set_text(fntMagic, WHITE, fa_left, fa_top);
		draw_text_border(
			tab_text_x[i],
			tab_text_y + 1,
			tab_text[i]
		)
	
	}

	// Inventory slots
	for (var pos = 0; pos < INV_N_ROWS*INV_N_COLS; pos++) {
		// Slot
		draw_sprite(
			sInvSlot,
			0,
			slot_x[pos],
			slot_y[pos]
		)
		// Item
		if (n_items > pos and items[pos] != NONE) {
			DrawItem(
				items[pos],
				slot_x[pos] + item_offset,
				slot_y[pos] + item_offset
			)
		}
	}
}





function InvDrawInfoWindow() {
	if (live_call()) return live_result;
	
	
	// Window
	draw_sprite_stretched(
		sInvWindowMain,
		0,
		info_x,
		info_y,
		info_w,
		info_h
	)
	// Heading
	draw_sprite_stretched(
		sInvWindowInfoHeading,
		0,
		info_x,
		info_y,
		info_w,
		info_heading_h
	)
	// Slot
	draw_sprite(
		sInvInfoSlot,
		0,
		info_slot_x,
		info_slot_y
	)
	// Textbox
	draw_sprite_stretched(
		sInvInfoTextbox,
		0,
		info_textbox_x,
		info_textbox_y,
		info_textbox_w,
		info_textbox_h
	)

	// Info tab item highlight
	if (item_select != NONE and items[item_select] != NONE) {
		var _item = items[item_select];

		// Name
		draw_set_halign(fa_center);
		draw_text_border(
			info_item_name_x,
			info_item_name_y,
			_item.name
		)

		// Image
		DrawItem(
			_item,
			info_item_x,
			info_item_y,
			true,
			1.5
		)
	
		// Description
		draw_set_text(fntLittlePixels);
		draw_text_edge_ext(
			info_item_desc_x,
			info_item_desc_y,
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
				
				// Draw button
				draw_sprite_stretched(
					info_buttons_sprite[i],
					0,
					info_buttons_x[i],
					info_buttons_y,
					info_buttons_w[i],
					info_buttons_h
				)
			}
		} else {
			draw_text_edge_ext(
				info_item_desc_x,
				info_item_desc_y + _desc_1_h,
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
		equip_x,
		equip_y,
		equip_w,
		equip_h
	)
	// Heading
	draw_sprite_stretched(
		sInvWindowEquipHeading,
		0,
		equip_x,
		equip_y,
		equip_w,
		equip_heading_h
	)
	// Player name
	draw_set_text(fntMagic);
	draw_text_border(
		name_x,
		name_y,
		name
	)
	
	// Equip slots
	for (var i = 0; i < INV_N_EQUIP_SLOTS; i++) {

		draw_sprite(
			sInvEquipSlot,
			0,
			equip_slot_x[i],
			equip_slot_y
		)
	}

	// Back button
	draw_sprite(
		sInvBack,
		0,
		back_x,
		back_y
	)

}