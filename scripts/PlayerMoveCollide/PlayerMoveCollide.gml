/// @desc Tiles are checked for each direction, using the two contact corners of the bounding box.
/// @desc Therefore walls must be larger than the player hitbox.
/// @desc Entities are checked using GameMaker collisions.
function PlayerMoveCollide() {

	// Horizontal
	// Entities	
    if entity_collision(x_speed, 0) {
        while !entity_collision(sign(x_speed), 0) {
            x += sign(x_speed);
        }
        x_speed = 0;
	}
	// Wall tiles
	// Right move
	if (
		tilemap_get_at_pixel(collision_map, bbox_right + x_speed, bbox_top) or
		tilemap_get_at_pixel(collision_map, bbox_right + x_speed, bbox_bottom)
	) {
		x -= bbox_right mod TILE_SIZE;
		x += TILE_SIZE - 1;
		x_speed = 0;
	}
	// Left move
	if (
		tilemap_get_at_pixel(collision_map, bbox_left + x_speed, bbox_top) or
		tilemap_get_at_pixel(collision_map, bbox_left + x_speed, bbox_bottom)
	) {
		x -= bbox_left mod TILE_SIZE;
		x_speed = 0;
	}
	x += x_speed;

	// Vertical
	// Entities
    if entity_collision(0, y_speed) {
        while !entity_collision(0, sign(y_speed)) {
            y += sign(y_speed);
        }
        y_speed = 0;
    }
	// Wall tiles
	// Down move
	if (
		tilemap_get_at_pixel(collision_map, bbox_left, bbox_bottom + y_speed) or
		tilemap_get_at_pixel(collision_map, bbox_right, bbox_bottom + y_speed)
	) {
		y -= bbox_bottom mod TILE_SIZE;
		y += TILE_SIZE - 1;
		y_speed = 0;
	}
	// Up move
	if (
		tilemap_get_at_pixel(collision_map, bbox_left, bbox_top + y_speed) or
		tilemap_get_at_pixel(collision_map, bbox_right, bbox_top + y_speed)
	) {
		y -= bbox_top mod TILE_SIZE;
		y_speed = 0;
	}
	y += y_speed;
	
}

/// @desc Helper function to check if we hit solid entities
function entity_collision(x_speed, y_speed) {
	var _entity_list = ds_list_create();
	var _entity_count = collision_rectangle_list(
		bbox_left + x_speed,
		bbox_top + y_speed,
		bbox_right + x_speed,
		bbox_bottom + y_speed,
		pEntity,
		false,
		true,
		_entity_list,
		false
	);
	for (var i = 0; i < _entity_count; i++) {
		var _entity= _entity_list[| i];
		if (_entity.is_solid) {
			ds_list_destroy(_entity_list);
			return true;
		}
	}
	ds_list_destroy(_entity_list);
	return false;	
}
