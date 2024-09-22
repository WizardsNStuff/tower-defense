extends Area2D

@onready var totalHealth : int = 100
@onready var Player_health_bar : ProgressBar = $HealthBar
 
func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		totalHealth -= body.damage
		Player_health_bar.value -= body.damage
		print(totalHealth)

func _physics_process(_delta: float) -> void:
	pass
