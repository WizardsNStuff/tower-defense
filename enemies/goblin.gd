extends "res://enemies/enemy.gd"


func _ready() -> void:
	move_speed = 150 # speed at which path is progressed
	max_health = 10
	damage = 5
	gold = 10
	current_health = max_health
