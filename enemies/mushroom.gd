extends "res://enemies/enemy.gd"
class_name Mushroom

func _ready() -> void:
	move_speed = 75 # speed at which path is progressed
	max_health = 25
	damage = 5
	gold = 5
