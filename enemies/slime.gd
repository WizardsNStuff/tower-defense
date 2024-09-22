extends "res://enemies/enemy.gd"
class_name Slime

func _ready() -> void:
	move_speed = 50 # speed at which path is progressed
	max_health = 50
	damage = 1
	gold = 5
