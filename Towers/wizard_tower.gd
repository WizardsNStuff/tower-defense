extends StaticBody2D

"""
TODO: change enemy name to be the same
name as the CharacterBody2D Node of enemy scene
""" 
var enemyName = "Badguy"
# array of bodies within the area of tower
var currentTargets = []
# current target we are shooting at
var current = null

# load potion sceen into memory before runtime to reduce lag
var Potion = preload("res://Towers/potion.tscn")
# var potionDamage = 5
var shootingCooldown = 0.3 # 1 seconds between each shot
var lastShotTime = 0.0

func _on_tower_radius_body_entered(body: Node2D) -> void:
	# if the body name of the object that entered is an enemy
	if enemyName in body.name:
		# update targets list
		update_target_list()
	print_debug("enemy ", body, " in radius")

func _on_tower_radius_body_exited(body: Node2D) -> void:
	# if the body that left the radius is current
	if current and body.get_parent() == current:
		current = null
	print_debug("enemy ", body, " left radius")

func update_target_list():
	# array for the enemy targets
	var enemyArray = []
	
	# get the towerRadius and make sure its casted as Area2D to
	# be able to use get_overlapping_bodies()
	var towerRadiusNode = get_node("Tower-Radius") as Area2D
	
	# returns array of every intersecting body, including other towers
	currentTargets = towerRadiusNode.get_overlapping_bodies()
	
	# loop thorugh all overlapping targets
	for target in currentTargets:
		# if the target is an enemy add to enemy array
		if enemyName in target.name:
			enemyArray.append(target)
	
	# loop through enemy targets
	for enemyTarget in enemyArray:
		# if no target is selected 
		if current == null:
			# select current target to targets PathFollow2D
			current = enemyTarget.get_parent()
		# target is already selected
		else: 
			# compare the target progress at arr[enemytarget] with current target progress
			# get the target with the furthest progress
			if enemyTarget.get_parent().get_progress() > current.get_progress():
				# new current is the target with greatest progress
				current = enemyTarget.get_parent()

func shoot():
	# if there is a current enemy
	if current:
		# create potion
		var p = Potion.instantiate()
		print_debug("potion position old: ", p.position)
		# get marker node
		var marker = get_node("PotionExitLocation")
		print_debug("position of marker: ", marker.position)
		
		# set potions position to markers position
		p.position = marker.position
		
		print_debug("potion position new: ", p.position)
		
		# calculate direction to current enemy
		# marker -> enemy = enemy - marker
		var direction = (current.position - marker.position).normalized()
		# set potions direction
		p.potion_direction = direction
		# add potion to scene
		get_tree().current_scene.add_child(p)
		
		# reset time of last shot to 0
		lastShotTime = 0.0

func _physics_process(delta: float) -> void:
	# check if there is a current enemy
	if current:
		# print_debug("shooting at target")
		# update time of last shot
		lastShotTime += delta
		
		# if time since last shot is >= cooldown time
		if lastShotTime >= shootingCooldown:
			# shoot at target
			shoot()
