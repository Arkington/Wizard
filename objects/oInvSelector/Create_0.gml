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


var _targets = InvSelectorGetTargets();
tar_x = _targets[0];
tar_y = _targets[1];
tar_w = _targets[2];
tar_h = _targets[3];

old_x = _targets[0];
old_y = _targets[1];
old_w = _targets[2];
old_h = _targets[3];

x = _targets[0];
y = _targets[1];
w = _targets[2];
h = _targets[3];

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