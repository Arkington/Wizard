if (live_call()) return live_result;

// Inventory trackers
enum TABS {
	ITEMS,
	KEY_ITEMS,
	MAGIC
}
tab = TABS.ITEMS;
item_select = NONE;

x = 29;
y = 41;

font = fntMagic;
draw_set_text(fntMagic, WHITE, fa_left, fa_top);
tab_text_height = string_height(ALPHABET) + 2;

// Tab stats
tab_text = [
	"Items",
	"Key Items",
	"Magic"
]
tab_widths = []
for (var i = 0; i < INV_N_TABS; i++) {
	tab_widths[i] = string_width(tab_text[i]) + 2*INV_TAB_TEXT_BUFFER_X + 2*INV_BORDER_THICKNESS;
}
tab_x = [0];
for (var i = 1; i < INV_N_TABS; i++) {
	tab_x[i] = tab_x[i - 1] + tab_widths[i - 1] - INV_BORDER_THICKNESS
}
tab_h = tab_text_height + INV_TAB_TEXT_BUFFER_Y;

// Slot stats
slot_w = sprite_get_width(sInvSlot);
slot_h = sprite_get_height(sInvSlot);

// Main window
inv_w = tab_x[INV_N_TABS - 1] + tab_widths[INV_N_TABS - 1];
excess = inv_w - 2*INV_BORDER_THICKNESS - (INV_N_COLS * (slot_w + INV_SLOT_BUFFER) - INV_SLOT_BUFFER);
inv_h = 2*(INV_BORDER_THICKNESS + INV_SLOTS_V_BUFFER) + INV_N_ROWS*(slot_h + INV_SLOT_BUFFER) + INV_SLOT_BUFFER;

// Items
items = global.inventory.items;
n_items = array_length(items);
item_offset = (slot_w - ITEM_SIZE)/2;

// Selector
selector = instance_create_layer(0, 0, LAYER_TEXT, oInvSelector);
selector.depth -= 2;

// Equip window
equip_x = 0;
equip_y = inv_h - 1;
name = "MMMMM";
name_x = equip_x + inv_w - string_width(name) - INV_BORDER_THICKNESS - INV_TAB_TEXT_BUFFER_X;
name_y = equip_y + INV_BORDER_THICKNESS + INV_TAB_TEXT_BUFFER_Y;
hp_x = equip_x + INV_BORDER_THICKNESS + INV_HP_OFFSET;
hp_y = equip_y + INV_BORDER_THICKNESS + INV_HP_OFFSET;
equip_heading_h = sprite_get_height(sInvWindowEquipHeading);
hp = NONE;
equip_slot_w = sprite_get_width(sInvEquipSlot);
equip_slot_h = sprite_get_height(sInvEquipSlot);
equip_w = inv_w;
equip_h = equip_heading_h + 2*INV_EQUIP_SLOT_OFFSET + equip_slot_h + INV_BORDER_THICKNESS;
back_w = sprite_get_width(sInvBack);
back_h = sprite_get_height(sInvBack);


// Info window
info_x = inv_w - 1;
info_y = -tab_h;
info_w = INV_INFO_WIDTH;
info_h = inv_h + tab_h;
info_heading_h = string_height(ALPHABET) + INV_BORDER_THICKNESS + 2*INV_INFO_TEXT_OFFSET;
info_slot_w = sprite_get_width(sInvInfoSlot);
info_slot_h = sprite_get_height(sInvInfoSlot);
info_slot_x = info_x + (info_w - info_slot_w)/2;
info_slot_y = info_y + info_heading_h + INV_INFO_SLOT_OFFSET;
info_textbox_x = info_x + INV_BORDER_THICKNESS + INV_INFO_TEXTBOX_OFFSET;
info_textbox_y = info_slot_y + info_slot_h + INV_INFO_SLOT_OFFSET;
info_textbox_w = info_w - 2*(INV_BORDER_THICKNESS + INV_INFO_TEXTBOX_OFFSET);
info_textbox_h = info_h - info_heading_h - INV_BORDER_THICKNESS - INV_INFO_TEXTBOX_OFFSET - 2*INV_INFO_SLOT_OFFSET - info_slot_h;
info_item_name_x = info_x + info_w/2;
info_item_name_y = info_y + INV_BORDER_THICKNESS + INV_INFO_TEXT_OFFSET;
info_item_desc_x = info_textbox_x + INV_INFO_TEXT_OFFSET;
info_item_desc_y = info_textbox_y + INV_INFO_TEXT_OFFSET - 2;
info_item_desc_w = info_textbox_w - 2*INV_INFO_TEXT_OFFSET + 1;
info_item_quote_x = info_item_desc_x;
info_item_quote_y = info_item_desc_y + 32;

info_buttons_w_total = info_w - 2*(INV_BORDER_THICKNESS + INV_INFO_TEXTBOX_OFFSET) - 4*INV_INFO_TEXT_OFFSET;
info_buttons_sprite = [
	sInvButtonMove,
	sInvButtonUse,
	sInvButtonDrop
]
info_buttons_w = [
	info_buttons_w_total div INV_N_INFO_BUTTONS,
	(info_buttons_w_total div INV_N_INFO_BUTTONS) + (info_buttons_w_total mod INV_N_INFO_BUTTONS),
	info_buttons_w_total div INV_N_INFO_BUTTONS
]
info_buttons_h = 16;
info_buttons_x[0] = info_item_desc_x;
info_buttons_x[1] = info_buttons_x[0] + INV_INFO_TEXT_OFFSET + info_buttons_w[0];
info_buttons_x[2] = info_buttons_x[1] + INV_INFO_TEXT_OFFSET + info_buttons_w[1];


print(info_w);
print(info_buttons_w);