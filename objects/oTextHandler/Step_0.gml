page_rendered = (activeTextbox != noone) && (activeTextbox.char_count >= activeTextbox.text_length);
final_page = (activeTextNode != noone) && (page >= array_length(activeTextNode.pages) - 1);

pause_page_timer--;

state();