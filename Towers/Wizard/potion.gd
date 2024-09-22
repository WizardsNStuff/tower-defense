extends Area2D

@export var weapon_speed = 200
var weapon_direction : Vector2
@export var weapon_damage = 0

func _physics_process(delta: float) -> void:
	self.position += weapon_direction * weapon_speed * delta	# move the weapon

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:		# if weapon collision is with an enemy
		body.take_damage(weapon_damage)	# damage the enemy
		queue_free()	# destroy weapon

func _on_timer_timeout() -> void:
	queue_free()	# despawn weapon after 'X' seconds
