extends Area2D

@onready var totalHealth : int = 100
@onready var Player_health_bar : ProgressBar = $HealthBar
 
func _on_body_entered(body: Enemy) -> void:
	totalHealth -= body.damage
	Player_health_bar.value -= body.damage
	print(totalHealth)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
