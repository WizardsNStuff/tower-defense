extends Node2D

var build_type
var player_health : int = 100
var player_gold : int = 50
var tower_prices : Dictionary = {
	"wizard" : 50, 
	"knight" : 50, 
	"archer" : 50, 
	"warrior" : 50
}

@onready var levelmap_script : TileMapLayer = $Level_map
@onready var towers_script : Node2D = $Towers
@onready var gold_label : Label = $Gold
@onready var health_label : Label = $Health



func _ready() -> void:
	BackgroundMusic.music = "res://Music/LevelMusic.wav"
	gold_label.text = "GOLD: " + str(player_gold)
	GameOver.showGameOver = false
	GameOver.showVictory = false
	
func initiate_build_mode(tower_type : String):
	build_type = tower_type
	var tile_pos = levelmap_script.get_selected_cell()
	var tower_price = tower_prices[tower_type]
	
	if can_buy_tower(tower_price):
		towers_script.add_tower(tower_type, tile_pos)	
		remove_gold(tower_price)

func can_buy_tower(price : int) -> bool:
	if player_gold - price < 0:
		return false
	return true

func add_gold(amount : int) -> void:
	player_gold += amount
	gold_label.text = "GOLD: " + str(player_gold)
	
func remove_gold(amount : int) -> void:
	player_gold -= amount
	gold_label.text = "GOLD: " + str(player_gold)

# Enemy made it to exit check
func _on_exit_body_entered(body: Node2D) -> void:
	if body is Enemy:
		remove_health(body.damage)
		if player_health <= 0:
			GameOver.showGameOver = true
			get_tree().change_scene_to_file("res://menus-and-interfaces/main_menu/Main_Menu.tscn")

func add_health(amount : int) -> void:
	player_health += amount
	health_label.text = "HEALTH: " + str(player_gold)
	
func remove_health(amount : int) -> void:
	player_health -= amount
	health_label.text = "HEALTH: " + str(player_gold)
