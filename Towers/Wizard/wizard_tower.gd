extends TowerBase
class_name Wizard

func _ready() -> void:
	######### Tower Stats ###
	weapon_damage = 25		# How much damage the projectile deals
	weapon_speed = 200		# How fast the projectile travels
	weapon_pierce = 1		# How many enemies can the projectile pass through before being freed
	damage_type = "Magic"	# Type of damage dealt by the projectile (Magic)
	is_ranged = true		# Is the weapon ranged?
	weapon_life = 3.0		# How long a projectile lives
	Weapon = load("res://Towers/Wizard/potion.tscn")
	#########################
