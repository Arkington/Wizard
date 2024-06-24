/// @desc Smooth movement progress
if (live_call()) return live_result;


progress = min(progress + max((1 - progress)*0.2, 0.05), 1);
