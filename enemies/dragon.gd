extends "res://enemies/enemy.gd"

func _ready() -> void:
	move_speed = 100 # speed at which path is progressed
	max_health = 100
	damage = 50
	gold = 100
	current_health = max_health
