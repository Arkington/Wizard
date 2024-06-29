if (live_call()) return live_result;

// Item select
item_select = NONE;
if ((selector.loc == INV_SELECTOR_LOC.MAIN or selector.loc == INV_SELECTOR_LOC.INFO) and selector.pos < n_items) {
	item_select = selector.pos;
}


// HP bar display
if (tab == TABS.ITEMS and hp == NONE) {
	hp = instance_create_layer(hp_x, hp_y, LAYER_TEXT, oHP);
	hp.hp_len = INV_HP_LEN;
	hp.depth -= 1;
} else if (tab != TABS.ITEMS and hp != NONE) {
	instance_destroy(hp);
	hp = NONE;
}