function Speaker(_portrait, _voices, _textbox_params = {}) {
    
    // Speakers must have a portrait and a voice, other textbox characteristics are optional
	struct_set(_textbox_params, "portrait", _portrait);
	struct_set(_textbox_params, "voices", _voices);
    return _textbox_params;
}

function Page(_speaker, _text, _textbox_params = {}, _code = function(){}) {

	// Speaker params added to textbox
    return {
        text: _text,
        textbox_params: struct_merge(_speaker, _textbox_params),
        code: _code
    }
}

function Choice(_text, _nextnode = NO_NEXT_NODE, _code = function(){}) {
    return {
        text: _text,
        nextnode: _nextnode,
        code: _code
    }
}

function TextNode(_pages, _choices = NO_CHOICES, _nextnode = NO_NEXT_NODE) {
    return {
        pages: _pages,
        choices: _choices,
        nextnode: _nextnode,
    }
}
