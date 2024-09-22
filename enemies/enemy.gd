extends CharacterBody2D
class_name Enemy

var move_speed : int	# speed at which path is progressed
var max_health : int
var damage : int
var gold : int
var current_health : int
var damageNumberScene = preload("res://enemies/damage_number.tscn")

func take_damage(damageAmount : int) -> void:
	current_health -= damageAmount
	# create a visual damage number
	var damageTaken : Label = damageNumberScene.instantiate()
	damageTaken.text = str(damageAmount)
	self.get_parent().get_parent().add_child(damageTaken)
	print(damageTaken.text)
	if current_health <= 0:
		queue_free()

func _physics_process(delta: float) -> void:
	var pathFollowNode = self.get_parent() as PathFollow2D	# PathFollow2D Node of the enemy
	var currentProgress = pathFollowNode.get_progress()	# get current progress on PathFollow2D

	pathFollowNode.set_progress(currentProgress + (move_speed * delta))	# move enemy along path
	
	if pathFollowNode.get_progress_ratio() == 1:		# if path progrss is at 100% (1)
		queue_free()	# remove badguy from scene
