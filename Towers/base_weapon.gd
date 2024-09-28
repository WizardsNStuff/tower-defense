extends Area2D
class_name WeaponBase

# Weapon stats given by tower
var weapon_damage: int			# How much damage the projectile deals
var weapon_speed: int			# How fast the projectile travels
var weapon_pierce: int			# How many enemies can the projectile pass through before being freed
var is_magic: bool			# Is the weapon Magical or Physical?
var is_ranged: bool				# Is the weapon ranged?
var weapon_life_span: float
var weapon_life: Timer

# Direction of weapon projectile
var weapon_direction : Vector2

func _physics_process(delta: float) -> void:
	if weapon_life == null:
		self.weapon_life = Timer.new()
		weapon_life.timeout.connect(self.despawn)
		self.add_child(weapon_life)
		weapon_life.start(weapon_life_span)
	self.position += weapon_direction * weapon_speed * delta	# move the projectile

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:		# if weapon collision is with an enemy
		body.take_damage(weapon_damage, is_magic, is_ranged)	# damage the enemy
		# despawn projectile if no more pierce
		if weapon_pierce <= 1:
			despawn()
		# Otherwise decrease pierce
		else:
			weapon_pierce -= 1

func despawn():
	self.queue_free()
