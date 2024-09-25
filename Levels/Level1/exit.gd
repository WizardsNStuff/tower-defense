extends Area2D

@onready var totalHealth : int = 100
@onready var healthBar = $"../Health" as Label
func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		totalHealth -= body.damage
		healthBar.text = "HEALTH: "
		if totalHealth <= 0:
			get_tree().change_scene_to_file("res://menus-and-interfaces/main_menu/Main_Menu.tscn")
			GameOver.showGameOver = true
