extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BackgroundMusic.music = "res://Music/MainMenu.wav"
	get_node("HBoxContainer/CenterContainer/GameOver").visible = GameOver.showGameOver
	get_node("HBoxContainer/CenterContainer/Victory").visible = GameOver.showVictory


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
