if (live_call()) return live_result;

inv = oInventory;
loc = INV_SELECTOR_LOC.MAIN;
pos = 0;
info_pos = 0;

held_item = NONE;
z = 0;
x_offset = 0;
y_offset = 0;

swap_in_item = NONE;
swap_out_item = NONE;
swap_progress = 0;
item_offset = (sprite_get_width(sInvSlot) - ITEM_SIZE)/2;



w = 0;
h = 0;

tar_x = 0;
tar_y = 0;
tar_w = 0;
tar_h = 0;

old_x = x;
old_y = y;
old_w = w;
old_h = h;

key = {};
progress = 1;

// Double tap info
last_key = NONE;
double_tap = false;
double_tap_timer = 0;

// Measurements
slot_w = sprite_get_width(sInvSlot);
slot_h = sprite_get_height(sInvSlot);

// Ellipse parameters (for swapping items)
a = 9;
b = INV_SELECTOR_GRAB_HEIGHT/2;




state = InvSelectorStateFree;