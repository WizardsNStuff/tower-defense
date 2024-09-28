extends TowerBase
class_name Archer

func _ready() -> void:
	######### Tower Stats ###
	weapon_damage = 25		# How much damage the projectile deals
	weapon_speed = 200		# How fast the projectile travels
	weapon_pierce = 1		# How many enemies can the projectile pass through before being freed
	is_magic = false		# Type of damage dealt by the projectile (Magic)
	is_ranged = true		# Is the weapon ranged?
	weapon_cooldown = 1.0
	weapon_life = 0.75		# How long a projectile lives
	Weapon = load("res://Towers/Archer/arrow.tscn")
	#########################
