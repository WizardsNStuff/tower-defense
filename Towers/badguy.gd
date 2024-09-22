extends CharacterBody2D

var move_speed = 100	# speed at which path is progressed
var max_health = 1000
var current_health = max_health

@onready var health_bar : ProgressBar = $HealthBar

func take_damage(damageAmount : int) -> void:
	current_health -= damageAmount
	health_bar.value = current_health
	if current_health <= 0:
		die()

func die() -> void:
	queue_free()

func _physics_process(delta: float) -> void:
	var pathFollowNode = get_parent() as PathFollow2D	# PathFollow2D Node of the enemy
	var currentProgress = pathFollowNode.get_progress()	# get current progress on PathFollow2D

	pathFollowNode.set_progress(currentProgress + (move_speed * delta))	# move enemy along path
	
	if pathFollowNode.get_progress_ratio() == 1:		# if path progrss is at 100% (1)
		queue_free()	# remove badguy from scene
		# TODO: subtract life from player
