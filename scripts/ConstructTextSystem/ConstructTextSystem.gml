function Speaker(_portrait, _voices, _textbox_params = {}) {
    
    // Speakers must have a portrait and a voice, other textbox characteristics are optional
	struct_set(_textbox_params, "portrait", _portrait);
	struct_set(_textbox_params, "voices", _voices);
    return _textbox_params;
}

enum PAGE_TYPE {
	NORMAL,
	PAUSE,
	CHOICE,
	SWIRL,
	CODE,
	GOTO,
}

/// @param {Any} _speaker
/// @param {String} _text
/// @param {Struct} _textbox_params
function Page(_speaker, _text, _textbox_params = {}) {

	// Speaker params added to textbox
    return {
		type: PAGE_TYPE.NORMAL,
        text: _text,
        textbox_params: struct_merge(_speaker, _textbox_params),
    }
}

function BattlePage(_speaker, _text, _pos, _textbox_params = {}) {

	var _battle_page_params = {};

	// Speaker params added to textbox
    return {
		type: PAGE_TYPE.NORMAL,
        text: _text,
        textbox_params: struct_merge(_speaker, struct_merge(_textbox_params, _battle_page_params)),
    }
}

/// @desc Special type of page which has no text and causes a mid-text pause cutscene.
function PausePage(_seconds = PAGE_PAUSE_S) {
	return {
		type: PAGE_TYPE.PAUSE,
		pause_page_s: _seconds,
	}
}

/// @desc Special type of page outlining choices. Usage: ChoicePage(Choice(...), Choice(...), ...)
function ChoicePage() {
	var _choices = [];
	for (var i = 0; i < argument_count; i++) {
		_choices[i] = argument[i];
	}
	
	return {
		type: PAGE_TYPE.CHOICE,
		choices: _choices, // Array of Choice()s
	}
}

/// @desc Special type of page outlining choices as a thought swirl. Usage: SwirlPage(Choice(...), Choice(...), ...)
function SwirlPage() {
	var _choices = [];
	for (var i = 0; i < argument_count; i++) {
		_choices[i] = argument[i];
	}
	
	return {
		type: PAGE_TYPE.SWIRL,
		choices: _choices, // Array of Choice()s
	}
}

/// @desc _nextnode specifies the key for the next page_array to load. _nextnode = NONE to continue the current dialogue.
function Choice(_text, _next_key = NONE, _code = function(){}) {
    return {
        text: _text,
        next_key: _next_key,
		code: _code,
    }
}

/// @desc Special type of page which just runs its code and does nothing else.
function CodePage(_code = function(){}) {
	return {
		type: PAGE_TYPE.CODE,
		code: _code,
	}
}

/// @desc Special type of page indicating that we move to a new key in the same text_souce.
function GoToPage(_goto) {
	return {
		type: PAGE_TYPE.GOTO,
		goto: _goto,
	}
}


/*
Deprecated...?

function TextNode(_pages, _choices = NO_CHOICES, _nextnode = NO_NEXT_NODE, _code = function(){}) {
    return {
        pages: _pages,
        choices: _choices,
        nextnode: _nextnode,
		code: _code,
    }
}
