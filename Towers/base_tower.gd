extends StaticBody2D
class_name TowerBase

######### Tower Stats ###########
var weapon_damage: int			# How much damage the projectile deals
var weapon_speed: int			# How fast the projectile travels
var weapon_pierce: int			# How many enemies can the projectile pass through before being freed
var damage_type: String			# Type of damage dealt by the projectile (Magic)
var is_ranged: bool				# Is the weapon ranged?
var weapon_life: int			# How long a projectile lives
#################################

var targetedEnemy: Enemy = null	# current target we are shooting at
var Weapon: WeaponBase			# Weapon we are shooting

# towerRadius casted as Area2D to be able to use get_overlapping_bodies()
@onready var towerRadiusNode = get_node("Tower-Radius") as Area2D

func _physics_process(_delta: float) -> void:
	update_enemy_priority()
	shoot()

func update_enemy_priority() -> void:
	var highestProgress = -1.0
	var enemies = towerRadiusNode.get_overlapping_bodies()
	# If no enemies in range
	if enemies.is_empty():
		targetedEnemy = null
	# If enemies in range
	else:
		# Check for enemy farthest down and set them to current enemy
		for enemy in enemies:
			var enemyProgress = (enemy.get_parent() as PathFollow2D).get_progress()
			if enemyProgress > highestProgress:
				highestProgress = enemyProgress
				targetedEnemy = enemy

func shoot() -> void:
	# If there is an enemy to shoot, then shoot
	if targetedEnemy != null:
		var weapon_instance = Weapon.instantiate()	# create weapon instance
		
		weapon_instance.global_position = self.global_position	# move weapon to marker
		# set weapon direction to enemy
		weapon_instance.weapon_direction = (targetedEnemy.global_position - self.global_position).normalized()
		self.add_child(weapon_instance)	# add weapon to scene
