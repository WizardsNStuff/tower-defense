extends Node2D

func add_tower(tower_type : String, tower_pos : Vector2) -> void:
	print("add tower")
	var path_name = "res://Towers/" + tower_type.capitalize() + "/" + tower_type + "_tower" + ".tscn"
	
	var tower_scene = load(path_name)
	
	var tower_instance : StaticBody2D = tower_scene.instantiate()
	
	print(tower_pos)
	
	print(tower_instance)
	
	add_child(tower_instance)
	
	
	
	
	
