menu_sprite = sMenubox;
selector_sprite = sAxelHat;

screenpos_x = 16;
screenpos_y = 64;
min_width = 16;
min_height = 16;

options = [
	"Default Menu Option 1",
	"Default Menu Option 2",
	"You get the idea",
];

scale = 1;
box_per_choice = false;

selector_width = sprite_get_width(selector_sprite);
selector_height = sprite_get_height(selector_sprite);
selector_xoffset = sprite_get_xoffset(selector_sprite);
selector_yoffset = sprite_get_yoffset(selector_sprite);
line_height = max(string_height(ALPHABET), selector_height);

x_buffer = CHOICE_MENU_BUFFER;
y_buffer = CHOICE_MENU_BUFFER;

// Initialize variables
width = min_width;
height = min_height;
pos = 0;

up = 0;
down = 0;
interact = 0;
n_options = 0;