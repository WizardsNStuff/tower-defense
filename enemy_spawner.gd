extends Node2D

@export var enemy_scenes : Array[PackedScene]
@export var spawn_interval = 1.0
@export var path_follow_node : PathFollow2D
@onready var spawn_timer : Timer = $SpawnTimer
@export var path_follow_scene = preload("res://path_follow_2d.tscn")

func spawn_enemy() -> void:
	# get random index for enemy
	var random_index = randi_range(0,enemy_scenes.size()-1)

	# get random enemy from scene array
	var enemy_scene = enemy_scenes[random_index]

	# create insatnce of enemy scene
	var enemy_instance = enemy_scene.instantiate()

	var path_follow_scene_instance = path_follow_scene.instantiate() 

	path_follow_scene_instance.add_child(enemy_instance)
	
	# add enemy to scene tree
	$"../Path2D".add_child(path_follow_scene_instance)
	
		#path_follow_node.set_process(0)
	#enemy_instance.position = path_follow_node.position
	
	spawn_timer.start()

func _on_spawn_timer_timeout() -> void:
	pass # spawn timer finished, spawn again

func _physics_process(delta: float) -> void:
	if spawn_timer.is_stopped():
		spawn_enemy()
