extends "res://enemies/enemy.gd"

func _ready() -> void:
	move_speed = 50 # speed at which path is progressed
	max_health = 10
	damage = 10
	gold = 20
	current_health = max_health
