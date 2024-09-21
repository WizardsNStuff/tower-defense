extends CharacterBody2D

# speed at which the path is completed
@export var progress_speed = 100

func _process(delta: float) -> void:
	
	# pathfollow node of badguy
	var pathFollowNode = get_parent() as PathFollow2D
	
	# get current progress on PathFollow2D
	var currentProgress = pathFollowNode.get_progress()
	
	# add progress to PathFollow2D
	pathFollowNode.set_progress(currentProgress + (progress_speed * delta))
	
	# check if path progrss is at 100% (1)
	if pathFollowNode.get_progress_ratio() == 1:
		# remove badguy from scene
		queue_free()
