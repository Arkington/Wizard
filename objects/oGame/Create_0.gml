/// @desc Initialize & Globals

// Commented for consistency
// randomize();
global.debug = false;
global.gamePaused = false;
global.fullscreen = false;
global.magic_font = font_add_sprite(sMagicFont2, 32, true, 2);

// Visual init
display_set_gui_size(RESOLUTION_W,RESOLUTION_H);

// Audio init
audio_listener_orientation(0, 0, 1, 0, -1, 0);
AudioSetLoopPoints();

// Create persistent objects in the Mechanics layer
layer_create(-LARGE, LAYER_MECHANICS);
global.event_handler = instance_create_layer(0, 0, LAYER_MECHANICS, oEventHandler);
global.text_handler = instance_create_layer(0, 0, LAYER_MECHANICS, oTextHandler);
global.music_handler = instance_create_layer(0, 0, LAYER_MECHANICS, oMusicHandler);
global.battle_engine = instance_create_layer(0, 0, LAYER_MECHANICS, oBattleEngine);
global.camera = instance_create_layer(0, 0, LAYER_MECHANICS, oCamera);


// Start
room_goto(ROOM_START);


// Development tools
save_state_message = "";
time_since_save_state = 0;