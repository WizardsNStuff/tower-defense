extends StaticBody2D
class_name TowerBase

# Tower stats
var weapon_damage: int			# How much damage the projectile deals
var weapon_speed: int			# How fast the projectile travels
var weapon_pierce: int			# How many enemies can the projectile pass through before being freed
var damage_type: String			# Type of damage dealt by the projectile (Magic)
var is_ranged: bool				# Is the weapon ranged?
var weapon_life: int			# How long a projectile lives

var enemiesInRadius = []		# array of enemies within the radius of tower
var targetedEnemy: Enemy = null	# current target we are shooting at
var Weapon: WeaponBase			# Weapon we are shooting

# towerRadius casted as Area2D to be able to use get_overlapping_bodies()
@onready var towerRadiusNode = get_node("Tower-Radius") as Area2D

#func _on_tower_radius_body_entered(body: Node2D) -> void:
	#if body is Enemy:		# if body that entered radius is an enemy
		#update_enemy_list()
#
#func _on_tower_radius_body_exited(body: Node2D) -> void:
	#if body is Enemy:
		#update_enemy_list()
	#if towerHasTargetedEnemy and body == targetedEnemy:	# if body leaving radius is targeted enemy
		#targetedEnemy = null	# no more targeted enemy
		#towerHasTargetedEnemy = false
#
#func update_enemy_list():
	#enemiesInRadius = towerRadiusNode.get_overlapping_bodies()	# get every body in radius
	#enemyArray.clear()
	#for body in enemiesInRadius:	# loop thorugh all bodies in radius
		#if body is Enemy:	# if the body is an enemy
			#enemyArray.append(body)
#
	#for enemy in enemyArray:	# loop through all enemy targets in radius
		#if targetedEnemy == null:	# if no enemy is targeted
			#targetedEnemy = enemy	# set current enemy
			#towerHasTargetedEnemy = true
		#else: # enemy is already targeted
			## get enemy with furthest path progress
			#if enemy.get_parent().get_progress() > targetedEnemy.get_parent().get_progress():
				#targetedEnemy = enemy # update targeted enemy to enemy with greatest progress
#
#func shoot():
	#if towerHasTargetedEnemy:		
		#var weapon_instance = Weapon.instantiate()	# create weapon instance
#
		#weapon_instance.global_position = marker.global_position	# move weapon to marker
#
		## calculate direction to targeted enemy
		#var directionToEnemy = (targetedEnemy.global_position - marker.global_position).normalized()
#
		#weapon_instance.weapon_direction = directionToEnemy	# set weapon direction
#
		#get_tree().current_scene.add_child(weapon_instance)	# add weapon to scene
#
		#cooldownTimer.start()	# Start cooldown timer after shooting


func _physics_process(_delta: float) -> void:
	update_enemy_priority()
	shoot()

func update_enemy_priority() -> void:
	var highestProgress = -1.0
	var enemies = towerRadiusNode.get_overlapping_bodies()
	if enemies.is_empty():
		targetedEnemy = null
	else:
		for enemy in enemies:
			var enemyProgress = (enemy.get_parent() as PathFollow2D).get_progress()
			if enemyProgress > highestProgress:
				highestProgress = enemyProgress
				targetedEnemy = enemy

func shoot() -> void:
	pass
