extends StaticBody2D

var Potion = preload("res://Towers/potion.tscn")
var potionDamage = 5
var pathName
var enemy = "Badguy"

# array of targets within the area of tower
var currentTargets = []

# current target we are shooting at
var current


func _on_area_2d_tower_body_entered(body: Node2D) -> void:
	
	# if the body name of the object that entered is "enemyname"
	if enemy in body.name:
		var tempArray = []
		
		# get the towerRadius and make sure its casted as Area2D to
		# get_overlapping_bodies() function
		var towerRadiusNode = get_node("Tower-Radius") as Area2D
		currentTargets = towerRadiusNode.get_overlapping_bodies()
		
		for target in currentTargets:
			if enemy in target.name:
				tempArray.append(target)

func _on_area_2d_tower_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
