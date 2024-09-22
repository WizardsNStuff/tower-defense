extends Node2D

var build_type
var player_gold : int = 1000
var tower_prices : Dictionary = {
	"wizard" : 225, 
	"knight" : 125, 
	"archer" : 50, 
	"warrior" : 25
}

@onready var levelmap_script : TileMapLayer = $Level_map
@onready var towers_script : Node2D = $Towers

func _ready() -> void:
	BackgroundMusic.music = "res://Music/LevelMusic.wav"
	
func initiate_build_mode(tower_type : String):

	build_type = tower_type
	var tile_pos = levelmap_script.get_selected_cell()

	
	var tower_price = tower_prices[tower_type]
	
	if can_buy_tower(tower_price):
		remove_gold(tower_price)
		towers_script.add_tower(tower_type, tile_pos)	

func can_buy_tower(price : int) -> bool:
	if player_gold - price < 0:
		return false
	return true

func add_gold(amount : int) -> void:
	player_gold += amount
	
func remove_gold(amount : int) -> void:
	player_gold -= amount
