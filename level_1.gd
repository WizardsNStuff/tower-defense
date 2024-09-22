extends Node2D

var map_node

var build_mode = false
var build_valid = false
var build_location
var build_type

@onready var levelmap_script : TileMapLayer = $Level_map
@onready var towers_script : Node2D = $Towers

func _ready() -> void:
	BackgroundMusic.music = "res://Music/LevelMusic.wav"

func _process(_delta: float) -> void:
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	pass
	
func initiate_build_mode(tower_type : String):
	print(tower_type)
	build_type = tower_type
	build_mode = true
	var tile_pos = levelmap_script.get_selected_cell()
	print(tile_pos)
	towers_script.add_tower(tower_type, tile_pos)
	
func update_tower_preview():
	pass
	
func cancel_build_mode():
	pass
	
func verify_and_build():
	pass
