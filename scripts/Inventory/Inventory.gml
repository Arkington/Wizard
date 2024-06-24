InitItems();

global.starting_inventory = {
	gold: 0,
	items: [
		global.ItemBeadNecklace,
		global.ItemBubbleWrap,
		global.ItemDogTreats,
		global.ItemGrapes,
		global.ItemLuckySpinner,
	],
	key_items: [],
	attacks: []
}

global.inventory = struct_copy(global.starting_inventory);


// Inventory management functions
function AddToInventory(_item) {
	if (_item.type == ITEM_TYPE.KEY) {
		array_push(global.inventory.key_items, _item);
	} else {
		array_push(global.inventory.items, _item);
	}
}


function DrawItem(_item, _x, _y, _shadow = true, _scale = 1) {
	
	// Shadow
	if (_shadow) {
		draw_sprite_ext(
			_item.sprite,
			0,
			_x + 1,
			_y + 1,
			_scale,
			_scale,
			0,
			BLACK,
			0.5
		)
	}
	
	draw_sprite_ext(
		_item.sprite,
		0,
		_x,
		_y,
		_scale,
		_scale,
		0,
		WHITE,
		1
	)

}