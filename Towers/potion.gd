extends Area2D

var potion_speed = 200
var potion_direction = Vector2()

var enemyName = "Badguy"

func _ready() -> void:
	rotation = potion_direction.angle()

func _physics_process(delta: float) -> void:
	self.position.x += potion_direction.x * potion_speed * delta
	self.position.y += potion_direction.y * potion_speed * delta
	
#func _on_body_entered(body: Node2D) -> void:
	## if potion hit enemy
	#if enemyName in body.name:
		## remove enemy
		#body.queue_free()
		## remove potion
		#queue_free()

#func _on_timer_timeout() -> void:
	#queue_free()
