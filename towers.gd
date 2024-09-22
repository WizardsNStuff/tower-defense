extends Node2D

func add_tower(tower_type : String, tower_pos : Vector2) -> void:

	var path_name = "res://Towers/" + tower_type.capitalize() + "/" + tower_type + "_tower" + ".tscn"
	
	var tower_scene = load(path_name)
	
	var tower_instance : StaticBody2D = tower_scene.instantiate()
	
	tower_instance.global_position = tower_pos
	
	add_child(tower_instance)
	
	
	
	
	
