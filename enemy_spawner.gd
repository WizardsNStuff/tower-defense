extends Node2D

@export var enemy_scenes : Array[PackedScene]
@export var spawn_interval = 1.0
@export var path_follow_node : PathFollow2D
@onready var spawn_timer : Timer = $SpawnTimer
@onready var wave_timer : Timer = $WaveTimer
@export var path_follow_scene = preload("res://path_follow_2d.tscn")

var slime = load("res://enemies/slime.tscn")
var goblin = load("res://enemies/goblin.tscn")
var skeleton = load("res://enemies/skeleton.tscn")
var orc = load("res://enemies/orc.tscn")
var dragon = load("res://enemies/dragon.tscn")
	
var waves = [
		[slime],
		[slime,goblin],
		[slime,goblin,skeleton],
		[slime,goblin,skeleton,orc],
		[slime,goblin,skeleton,orc,dragon]
]

var wave_number = 0

func spawn_enemy() -> void:
	var wave_mob_size = waves[wave_number].size()
	
	# get random index for enemy
	var random_index = randi_range(0,wave_mob_size - 1)

	# get random enemy from scene array
	var enemy_scene = waves[wave_number][random_index]

	# create insatnce of enemy scene
	var enemy_instance = enemy_scene.instantiate()

	var path_follow_scene_instance = path_follow_scene.instantiate() 

	path_follow_scene_instance.add_child(enemy_instance)
	
	# add enemy to scene tree
	$"../Path2D".add_child(path_follow_scene_instance)
	
		#path_follow_node.set_process(0)
	#enemy_instance.position = path_follow_node.position
	
	spawn_timer.start()
	if wave_timer.is_stopped():
		wave_timer.start()
	

func _on_spawn_timer_timeout() -> void:
	pass # spawn timer finished, spawn again

func _physics_process(_delta: float) -> void:
	if spawn_timer.is_stopped():
		spawn_enemy()
	if wave_timer.is_stopped():
		# goto next wave
		# win
		print("wave number: ", wave_number + 1)
		if wave_number >= enemy_scenes.size()-1:
			#load win scene
			# if no enemies on screen
			print("WINNNN")
			get_tree().change_scene_to_file("res://menus-and-interfaces/main_menu/Main_Menu.tscn")
			GameOver.showGameOver = true
			pass
		else:
			wave_number += 1
			spawn_enemy()


func _on_wave_timer_timeout() -> void:
	pass # Replace with function body.
