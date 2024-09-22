extends "res://enemies/enemy.gd"

func _ready() -> void:
	move_speed = 200 # speed at which path is progressed
	max_health = 100
	damage = 50
	current_health = max_health
