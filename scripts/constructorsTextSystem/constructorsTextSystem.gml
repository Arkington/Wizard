function Speaker(_portrait, _voice) {
    return {
        portrait: _portrait,
        voice: _voice,
    }
}

function Page(_speaker, _text, _code = function(){}) {
    return {
        text: _text,
        portrait: _speaker.portrait,
        voice: _speaker.voice,
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

function TextNode(_pages, _choices = NO_CHOICES, _nextnode = NO_NEXT_NODE, _code = function(){}) {
    return {
        pages: _pages,
        choices: _choices,
        nextnode: _nextnode,
        code: _code
    }
}


/*
TODO:
 - Make a file which just contains these for Axel and Hatrick
 - Make a panicked Hatrick sprite as a text
 - Continue tutorial