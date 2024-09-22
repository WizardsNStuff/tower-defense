extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		# mouse position relative to the cells (size of the tilemap)
		#var local_mouse_pos = get_local_mouse_position()
		
		# get a vector for the tile that was clicked
		#var clicked_tile = self.local_to_map(local_mouse_pos)
		
		# add 1 to x so we can spawn the menu to the right of the clicked tile
		#clicked_tile.x += 1
		
		var shop_instance = preload("res://menus-and-interfaces/tower_shop/tower_shop.tscn").instantiate()
		
		# add shop_hud as child of root
		get_tree().current_scene.add_child(shop_instance)

		# get width and height of hud
		var hud_color_rect = shop_instance.get_node("ScrollContainer").get_node("ColorRect")
		var hud_width = hud_color_rect.get_rect().size.x
		var hud_height = hud_color_rect.get_rect().size.y
		
		# get size of window
		var viewport_size = get_viewport().get_visible_rect().size

		var right_margin = 40
		var top_margin = 50
		var hud_position_x = (viewport_size.x / 2) - hud_width - right_margin
		var hud_position_y = -1 * (viewport_size.y / 2) + top_margin
		
		# mvoe shop to correct position
		shop_instance.position = Vector2(hud_position_x, hud_position_y)
