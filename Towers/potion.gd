extends Area2D

var potion_speed = 300
var potion_direction : Vector2
var potion_damage = 0
var enemyName = "Badguy"

func _physics_process(delta: float) -> void:
	self.position += potion_direction * potion_speed * delta	# move the potion

func _on_body_entered(body: Node2D) -> void:
	if enemyName in body.name:		# if potion collision is with an enemy
		body.take_damage(potion_damage)	# damage the enemy
		self.queue_free()	# destroy potion

func _on_timer_timeout() -> void:
	queue_free()	# despawn potion after 'X' seconds
