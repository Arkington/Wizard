// Item types
enum ITEM_TYPE {
	CONSUME,
	EQUIP,
	KEY
}

// Item struct
function Item(_name, _sprite, _type, _desc_1, _desc_2, _quote) {
    return {
        name: _name,
		sprite: _sprite,
		type: _type,
		desc_1: _desc_1,
		desc_2: _desc_2,
		quote: _quote,
    }
}

function InitItems() {

	// Consumables
	ItemGrapes = Item(
		"Grapes",
		sItemGrapes,
		ITEM_TYPE.CONSUME,
		"Some grapes you brought for lunch.",
		"Restores 4 HP.",
		"Also good for throwing at people!"
	)

	ItemBubbleWrap = Item(
		"Bubble Wrap",
		sItemBubbleWrap,
		ITEM_TYPE.CONSUME,
		"Magical wrapping paper enchanted with pockets of air.",
		"Restores 10 HP.",
		"I like the noise it makes!"
	)

	ItemLuckySpinner = Item(
		"Lucky Spinner",
		sItemLuckySpinner,
		ITEM_TYPE.CONSUME,
		"A spinner made out of cardboard and wire.",
		"Restores 1-20 HP.",
		"I wonder what I'll get?"
	)

	/*
	Chip = Item(
		"Chip - Stolen",
		ITEM_TYPE.CONSUME,
		"A single chip, stolen from someone's plate. Restores 1 HP.",
		"They probably wouldn't have eaten it anyway."
	)

	Cupcake = Item(
		"Great Wizard Cupcake",
		ITEM_TYPE.CONSUME,
		"A cupcake baked by Hocus Croakus using the power of magic. Restores 5 HP.",
		"I wonder if he added a secret ingredient..."
	)


	// Equipment
	LeatherGlove = Item(
		"Leather Glove",
		ITEM_TYPE.EQUIP,
		"A leather glove that makes your hands more resilient. Small chance to parry incoming damage.",
		"Wearing this makes me feel cool for some reason."
	)
	*/

	ItemBeadNecklace = Item(
		"Bead Necklace",
		sItemBeadNecklace,
		ITEM_TYPE.EQUIP,
		"A necklace with small wooden beads threaded through.",
		"Restores 1 HP if you don't take damage during a turn.",
		"I just like the way it feels."
	)


	// Key items
	ItemDogTreats = Item(
		"Dog Treats",
		sItemDogTreats,
		ITEM_TYPE.KEY,
		"Dog treats. Perhaps enjoyed by a dog.",
		"",
		"I'm really curious... but I won't try one."
	)

}