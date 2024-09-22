extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		# mouse position relative to the cells (size of the tilemap)
		var local_mouse_pos = get_local_mouse_position()
		
		# get a vector for the tile that was clicked
		var clicked_tile = self.local_to_map(local_mouse_pos)
		
		# add 1 to x so we can spawn the menu to the right of the clicked tile
		#clicked_tile.x += 1
		
		var shop_instace = preload("res://menus-and-interfaces/tower_shop/tower_shop.tscn").instantiate()
		shop_instace.position = self.map_to_local(clicked_tile)
		add_child(shop_instace)
		
		print(clicked_tile)
		
		
