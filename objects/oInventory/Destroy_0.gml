/// @desc Created objects

if (live_call()) return live_result;

global.inventory.items = items;
instance_destroy(selector);
if (hp != NONE) { instance_destroy(hp); }