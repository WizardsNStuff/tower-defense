extends "res://enemies/enemy.gd"

func _ready() -> void:
	move_speed = 50 # speed at which path is progressed
	max_health = 100
	damage = 10
	current_health = max_health
