extends Node2D

var map_node

var build_mode = false
var build_valid = false
var build_location
var build_type


func _ready() -> void:
	BackgroundMusic.music = "res://Music/LevelMusic.wav"

func _process(_delta: float) -> void:
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	pass
	
func initiate_build_mode(tower_type : String):
	print(tower_type)
	pass
	
func update_tower_preview():
	pass
	
func cancel_build_mode():
	pass
	
func verify_and_build():
	pass
