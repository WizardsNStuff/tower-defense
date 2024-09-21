extends TextureButton


func _on_pressed():
	print("Options")
	get_tree().change_scene_to_file("res://assets/options_menu/options_menu.tscn")
