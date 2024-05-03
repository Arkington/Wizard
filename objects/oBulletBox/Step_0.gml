// x/y approach the target
x = x + 0.2*(target_x - x);
y = y + 0.2*(target_y - y);

// Width/height approach the target
w = w + 0.2*(target_w - w);
h = h + 0.2*(target_h - h);
image_xscale = w/sprite_get_width(sBulletBox);
image_yscale = h/sprite_get_height(sBulletBox);

// Keep oCore inside
if !instance_exists(oCore) { exit; }
if (oCore.bbox_top < bbox_top) { oCore.y += bbox_top - oCore.bbox_top; }
if (oCore.bbox_bottom > bbox_bottom) { oCore.y += bbox_bottom - oCore.bbox_bottom; }
if (oCore.bbox_left < bbox_left) { oCore.x += bbox_left - oCore.bbox_left; }
if (oCore.bbox_right > bbox_right) { oCore.x += bbox_right - oCore.bbox_right; }
