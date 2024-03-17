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

selector_width = sprite_get_width(sAxelHat);
selector_height = sprite_get_height(sAxelHat);
line_height = max(string_height(ALPHABET), selector_height);

x_offset = 4;
y_offset = 4;

// Initialize variables
width = min_width;
height = min_height;
pos = 0;

up = 0;
down = 0;
interact = 0;
n_options = 0;