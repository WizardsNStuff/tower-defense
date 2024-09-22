extends Area2D

@onready var totalHealth : int = 100
@onready var Player_health_bar : ProgressBar = $HealthBar
 
func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		totalHealth -= body.damage
		Player_health_bar.value -= body.damage
		if totalHealth <= 0:
			get_tree().change_scene_to_file("res://menus-and-interfaces/main_menu/Main_Menu.tscn")
			GameOver.showGameOver = true
			print('dead')
		print(totalHealth)

func _physics_process(_delta: float) -> void:
	pass
