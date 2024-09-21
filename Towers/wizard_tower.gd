extends StaticBody2D

var Potion = preload("res://Towers/potion.tscn")
var potionDamage = 5
var pathName

"""
TODO: change enemy name to be the same
name as the CharacterBody2D Node of enemy scene
""" 
var enemyName = "Badguy"

# array of bodies within the area of tower
var currentTargets = []

# current target we are shooting at
var current = null

func _on_tower_radius_body_entered(body: Node2D) -> void:
	# if the body name of the object that entered is an enemy
	if enemyName in body.name:
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
				

func _on_tower_radius_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
