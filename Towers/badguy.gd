extends "res://enemies/enemy.gd"
class_name Badguy

func _ready() -> void:
	move_speed = 50 # speed at which path is progressed
	max_health = 5000
	damage = 1
	current_health = max_health
