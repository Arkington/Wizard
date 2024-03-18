/// @desc Constructors for Thought Swirls
function Thought(_thought, _textnode) {
    return {
        thought: _textnode,
        textnode: _textnode,
    }
}

/// @desc Constructors for Thought Swirls
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