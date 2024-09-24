extends Node2D

@export var path2D_node : Path2D
@onready var spawn_timer : Timer = $SpawnTimer
@export var path_follow_scene = preload("res://path_follow_2d.tscn")

# Basic enemy can be killed by every tower
var slime = load("res://enemies/slime.tscn")
# Fast + low health enemy that requires archers
var goblin = load("res://enemies/goblin.tscn")
# Slow and immune to everything but magic attacks
var skeleton = load("res://enemies/skeleton.tscn")
# Very Tanky and Slow, spawns mushroom ads, immune to ranged damage
var lich = load("res://enemies/lich.tscn")
# Boss Enemy, requires attacks from 4 different party members to deal a burst of damage
var dragon = load("res://enemies/dragon.tscn")

var waveGold := 25
var waves := [
		# Wave 1: 10 slimes -> 50 Gold
		[slime,slime,slime,slime,slime,slime,slime,slime,slime,slime],
		# Wave 2: 5 slimes + 5 goblins -> 75 Gold
		[slime,goblin,slime,goblin,slime,goblin,slime,goblin,slime,goblin],
		# Wave 3: 5 slimes + 1 goblins + 1 skeleton-> 100 Gold
		[slime,slime,slime,slime,slime,slime,slime,slime,goblin,skeleton],
		# Wave 4:
		[slime,goblin,skeleton,lich],
		# Wave 5:
		[slime,goblin,skeleton,lich,dragon]
]

var wave_number = 0
var is_wave_finished := true

@onready var wave_label : Label = $"../WaveTime"

func spawn_wave() -> void:
	# Spawn every enemy in current wave
	for enemy in waves[wave_number]:
		spawn_timer.start()
		# Spawn enemy with pathfollow node and add to path2d
		var enemy_scene = enemy.instantiate()
		var pfScene = PathFollow2D.new()
		pfScene.rotates = false
		pfScene.add_child(enemy_scene)
		path2D_node.add_child(pfScene)
		# Wait for spawner to finish before next loop
		await spawn_timer.timeout
	
	# wave is finished so go to next wave
	wave_number += 1
	

func _on_next_wave_pressed() -> void:
	if path2D_node.get_children().is_empty():
		spawn_wave()

func _physics_process(_delta: float) -> void:
	# Wave label update
	wave_label.text = "WAVE: " + str(wave_number + 1)
	
	# Victory check
	if (wave_number > waves.size()) && (path2D_node.get_children().is_empty()):
		GameOver.showVictory = true
		get_tree().change_scene_to_file("res://menus-and-interfaces/main_menu/Main_Menu.tscn")
