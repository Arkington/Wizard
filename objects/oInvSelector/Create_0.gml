if (live_call()) return live_result;


loc = INV_SELECTOR_LOC.MAIN;
pos = 0;
info_pos = 0;
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