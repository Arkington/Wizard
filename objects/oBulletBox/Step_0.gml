/// @desc Keep oCore inside
if (oCore.bbox_top < bbox_top) { oCore.y += bbox_top - oCore.bbox_top; }
if (oCore.bbox_bottom > bbox_bottom) { oCore.y += bbox_bottom - oCore.bbox_bottom; }
if (oCore.bbox_left < bbox_left) { oCore.x += bbox_left - oCore.bbox_left; }
if (oCore.bbox_right > bbox_right) { oCore.x += bbox_right - oCore.bbox_right; }