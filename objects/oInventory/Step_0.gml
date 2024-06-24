if (live_call()) return live_result;

// Item select
item_select = NONE;
if (selector.loc == INV_SELECTOR_LOC.MAIN and selector.pos < n_items) {
	item_select = selector.pos;
}

if keyboard_check_pressed(vk_space) {
	highlighted_tab++;
	if highlighted_tab > INV_N_TABS - 1 {
		highlighted_tab = 0;
	}
}