/// @desc Initialize & Globals

// Commented for consistency
// randomize();
global.debug = false;
global.gamePaused = false;
display_set_gui_size(RESOLUTION_W,RESOLUTION_H);

// Create persistent objects in the Mechanics layer
layer_create(-LARGE, LAYER_MECHANICS);
global.event_handler = instance_create_layer(0, 0, LAYER_MECHANICS, oEventHandler);
global.text_handler = instance_create_layer(0, 0, LAYER_MECHANICS, oTextHandler);
global.camera = instance_create_layer(0, 0, LAYER_MECHANICS, oCamera);

room_goto(ROOM_START);