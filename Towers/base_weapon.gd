extends Area2D
class_name WeaponBase

# Weapon stats given by tower
var weapon_damage: int		# How much damage the projectile deals
var weapon_speed: int		# How fast the projectile travels
var weapon_pierce: int		# How many enemies can the projectile pass through before being freed
var damage_type: String		# Type of damage dealt by the projectile (Magic)
var is_ranged: bool			# Is the weapon ranged?
var weapon_life: Timer

# Direction of weapon projectile
var weapon_direction : Vector2

func _init(weapon_damage: int, weapon_speed: int, weapon_pierce: int,
weapon_life_span: float, damage_type: String, is_ranged: bool) -> void:
	# Despawn after x seconds
	self.weapon_life = Timer.new()
	self.weapon_life.wait_time = weapon_life_span
	weapon_life.timeout.connect(despawn())
	
	self.weapon_damage = weapon_damage
	self.weapon_speed = weapon_speed
	self.weapon_pierce = weapon_pierce
	self.damage_type = damage_type
	self.is_ranged = is_ranged

func _physics_process(delta: float) -> void:
	self.position += weapon_direction * weapon_speed * delta	# move the projectile

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:		# if weapon collision is with an enemy
		body.take_damage(weapon_damage, damage_type, is_ranged)	# damage the enemy
		# despawn projectile if no more pierce
		if weapon_pierce <= 1:
			queue_free()
		# Otherwise decrease pierce
		else:
			weapon_pierce -= 1

func despawn():
	self.queue_free()
