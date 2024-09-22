extends StaticBody2D

var bodiesInRadius = []	# array of bodies within the radius of tower
var enemyArray = []	# array for the enemy bodies
var targetedEnemy = null	# current target we are shooting at
var towerHasTargetedEnemy = false	# if we have a current targeted enemy
@export var Weapon = preload("res://Towers/Wizard/potion.tscn")

# towerRadius casted as Area2D to be able to use get_overlapping_bodies()
@onready var towerRadiusNode = get_node("Tower-Radius") as Area2D
@onready var marker : Marker2D = $Marker	# marker for starting shooting position
@onready var cooldownTimer : Timer = $CooldownTimer # Timer node for the shooting cooldown

func _on_tower_radius_body_entered(body: Node2D) -> void:
	if body is Enemy:		# if body that entered radius is an enemy
		update_enemy_list()

func _on_tower_radius_body_exited(body: Node2D) -> void:
	if towerHasTargetedEnemy and body == targetedEnemy:	# if body leaving radius is targeted enemy
		targetedEnemy = null	# no more targeted enemy
		towerHasTargetedEnemy = false

func update_enemy_list():
	bodiesInRadius = towerRadiusNode.get_overlapping_bodies()	# get every body in radius

	for body in bodiesInRadius:	# loop thorugh all bodies in radius
		if body is Enemy:	# if the body is an enemy
			enemyArray.append(body)

	for enemy in enemyArray:	# loop through all enemy targets in radius
		if targetedEnemy == null:	# if no enemy is targeted
			targetedEnemy = enemy	# set current enemy
			towerHasTargetedEnemy = true
		else: # enemy is already targeted
			# get enemy with furthest path progress
			if enemy.get_parent().get_progress() > targetedEnemy.get_parent().get_progress():
				targetedEnemy = enemy # update targeted enemy to enemy with greatest progress

func shoot():
	if towerHasTargetedEnemy:		
		var weapon_instance = Weapon.instantiate()	# create weapon instance

		weapon_instance.global_position = marker.global_position	# move weapon to marker

		# calculate direction to targeted enemy
		var directionToEnemy = (targetedEnemy.global_position - marker.global_position).normalized()

		weapon_instance.weapon_direction = directionToEnemy	# set weapon direction

		get_tree().current_scene.add_child(weapon_instance)	# add weapon to scene

		cooldownTimer.start()	# Start cooldown timer after shooting

func _on_timer_timeout() -> void:
	pass # cooldown timer finished, you can now shoot again

func _physics_process(_delta: float) -> void:
	if towerHasTargetedEnemy and cooldownTimer.is_stopped():
		shoot()
