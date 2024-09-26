extends Enemy
class_name Lich

func _ready() -> void:
	move_speed = 100
	max_health = 50
	damage = 20
	gold = 50
	current_health = max_health
