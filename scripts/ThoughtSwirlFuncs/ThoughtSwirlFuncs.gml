/// @desc Creates a thought swirl's textbox. Used in CreateThoughtSwirl().
function create_thought_textbox(_thought) {
    return create_textbox(Page(
		Speaker(NO_PORTRAIT, NO_VOICE),
		_thought,
		{
			textbox_sprite : sMenubox,
			textbox_font : fntTextswirl,
			textbox_width : THOUGHT_WIDTH/THOUGHT_TEXT_SCALE,
			textbox_height : THOUGHT_HEIGHT/THOUGHT_TEXT_SCALE,
			x_buffer : 2,
			y_buffer : 2,
			scale : THOUGHT_TEXT_SCALE,
			alpha : 0.5
		}
	));
}

/// @desc Create a thought swirl from a struct
function CreateThoughtSwirl(_thought_swirl_name, _secs_until_appear = 4, _secs_until_disappear = 10) {
	var _swirl = instance_create_layer(0, 0, LAYER_INSTANCES, oThoughtSwirl);
	with (_swirl) {
		
		// Setup Thought Swirl
		thought_swirl_name = _thought_swirl_name;
		thought_swirl = variable_global_get(thought_swirl_name);
		secs_until_appear = _secs_until_appear;
		secs_until_disappear = _secs_until_disappear;
		
		n_thoughts = 0;
		thought_angles = [];
		struct_foreach(thought_swirl, function(_thought, _textnode) {
		    thought_textboxes[n_thoughts] = create_thought_textbox(_thought);
		    thoughts[n_thoughts] = _thought;
			thought_scales[n_thoughts] = THOUGHT_TEXT_SCALE;
		    n_thoughts++;
		});
		for (var i = 0; i < n_thoughts; i++) {
		    thought_angles[i] = 360 * i / n_thoughts;
		}
	}
}