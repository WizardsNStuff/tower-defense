extends Node2D

@export var enemy_scenes : Array[PackedScene]
@export var spawn_interval = 1.0
@export var path2D_node : Path2D
@onready var spawn_timer : Timer = $SpawnTimer
@onready var wave_timer : Timer = $WaveTimer
@export var path_follow_scene = preload("res://path_follow_2d.tscn")

var slime = load("res://enemies/slime.tscn")
var goblin = load("res://enemies/goblin.tscn")
var skeleton = load("res://enemies/skeleton.tscn")
var orc = load("res://enemies/orc.tscn")
var dragon = load("res://enemies/dragon.tscn")

var waveGold := 25
var waves := [
		# Wave 1: 10 slimes - 50 Gold
		[slime,slime,slime,slime,slime,slime,slime,slime,slime,slime],
		[slime, goblin],
		[slime,goblin,skeleton],
		[slime,goblin,skeleton,orc],
		[slime,goblin,skeleton,orc,dragon]
]

var wave_number = 0
var is_wave_finished := true
var stop_mob_spawns = false 

@onready var wave_label : Label = $"../WaveTime"

func spawn_wave() -> void:
	is_wave_finished = false
	# Spawn every enemy in current wave
	for enemy in waves[wave_number]:
		spawn_timer.start()
		# Spawn enemy with pathfollow node and add to path2d
		var enemy_scene = enemy.instantiate()
		var pfScene = path_follow_scene.instantiate()
		pfScene.add_child(enemy_scene)
		path2D_node.add_child(pfScene)
		# Wait for spawner to finish before next loop
		await spawn_timer.timeout
	# wave is finished so go to next wave
	is_wave_finished = true
	wave_number += 1

func _on_next_wave_pressed() -> void:
	if is_wave_finished == true:
		spawn_wave()

func _physics_process(_delta: float) -> void:
	wave_label.text = "WAVE: " + str(wave_number + 1)
