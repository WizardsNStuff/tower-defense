extends CharacterBody2D
class_name Enemy

var move_speed : int	# speed at which path is progressed
var max_health : int
var damage : int
var gold : int
var current_health : int

func _ready() -> void:
	collision_layer = 2

func take_damage(damageAmount : int, is_magic: bool, is_ranged: bool) -> void:
	current_health -= damageAmount
	DamageNumbers.displayNumber(damageAmount, self.global_position)
	if current_health <= 0:
		var label_script = get_parent().get_parent().get_parent()
		label_script.add_gold(gold)
		get_parent().queue_free()

func _physics_process(delta: float) -> void:
	var pathFollowNode = self.get_parent() as PathFollow2D	# PathFollow2D Node of the enemy
	var currentProgress = pathFollowNode.get_progress()	# get current progress on PathFollow2D

	pathFollowNode.set_progress(currentProgress + (move_speed * delta))	# move enemy along path
	
	if pathFollowNode.get_progress_ratio() == 1:		# if path progrss is at 100% (1)
		get_parent().queue_free()	# remove badguy from scene
