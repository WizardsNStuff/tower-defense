extends Area2D



func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Continue")



func _on_mouse_entered():
	print("Continue Hover")
	
