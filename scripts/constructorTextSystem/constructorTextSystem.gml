function Page(_text, _code = function(){}) constructor {
    text = _text;
    code = _code;
}

function Choice(_text, _nextnode = noone, _code = function(){}) constructor {
    text = _text;
    nextnode = _nextnode;
    code = _code;
}

function TextNode(_pages, _nextnode = noone, _choices = noone, _code = function(){}) constructor {
    pages = _pages;
    nextnode = _nextnode;
    choices = _choices;
    code = _code;
}