extends TileMapLayer

var shop_instance : Node = null
var selected_tile : Vector2

func get_selected_cell() -> Vector2:
	return selected_tile

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

		var global_mouse_pos = get_global_mouse_position()

		#highlight_tile(clicked_tile)

		if shop_instance:
			# if shop is already open close it
			shop_instance.queue_free()
			shop_instance = null
			
		else:
			shop_instance = preload("res://menus-and-interfaces/tower_shop/tower_shop.tscn").instantiate()

			selected_tile = global_mouse_pos
			
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

func highlight_tile(tile_pos) -> void:
	pass
