/// @param _page
function create_textbox(_page, _fade_in = true) {
	textbox = instance_create_layer(0, 0, LAYER_TEXT, oTextbox);
	textbox_params = _page.textbox_params;
	with (textbox) {
		text = _page.text;
		
		// Add any optional parameters supplied in the Page()
		struct_foreach(other.textbox_params, function(_param, _value) {
			variable_instance_set(id, _param, _value);
		});
		// Specify fade in
		variable_instance_set(id, "fade_in", _fade_in);
		
		SetupTextbox();
	}
	return textbox;
}

/// @param _choices
function create_choice_menu(_choices) {
	var choice_menu = instance_create_layer(0, 0, LAYER_TEXT, oChoiceMenu);
	with choice_menu {
		choices = _choices;
		options = [];
		for (var i = 0; i < array_length(_choices); i++) {
			options[i] = _choices[i].text;
		}
		MenuSetup();

		// Menu y-pos
		screenpos_y = TEXTBOX_BOTTOM_Y - height - y_buffer;
	
	}
	return choice_menu;
}

/// @desc Loads text into the text handler. 
/// @desc _key can be a single key or array of keys, which creates a Frankenstein page_array of several other page arrays meshed together.
function load_text(_text_struct_name, _key = DEFAULT_TEXT_KEY) {

	var _text_struct = variable_global_get(_text_struct_name);

	// Multiple key functionality
	if is_array(_key) {
		var _page_array = [];
		for (var i = 0; i < array_length(_key); i++) {
			var _sub_page_array = struct_get(_text_struct, _key[i]);
			_page_array = array_concat(_page_array, _sub_page_array);
		}
	} else {
		var _page_array = struct_get(_text_struct, _key);
	}
	
	with global.text_handler {
		if instance_exists(oPlayer) { player_state_prior = oPlayer.state; }
		text_struct = _text_struct;
		page_array = _page_array;
	}
}

/// @desc Resets the global text handler
function ClearTextHandler() {
	with global.text_handler {
		instance_destroy(active_choice_menu);
		active_choice_menu = noone;
		instance_destroy(active_thought_swirl);
		active_thought_swirl = noone;
		instance_destroy(active_textbox);
		active_textbox = noone;
		page_array = NONE;
		state = TextHandlerStateAwaiting;
	}
}

function TextNode() {
	return argument;
}