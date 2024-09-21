extends Area2D

var potion_speed = 100
var potion_direction = Vector2()

var enemyName = "Badguy"

# current camera
@onready var camera = $Camera2D

func _ready() -> void:
	# set potion rotation based on the direction
	rotation = potion_direction.angle()

func _physics_process(delta: float) -> void:
	# move potion in given direction
	position += potion_direction * potion_speed * delta
	
	if camera:
		# calculate the cameras bounds
		var camera_size = camera.get_viewport_rect().size # get cameras width and height
		var camera_position = camera.position	# center coords of camera
		
		var half_camera_height = camera_size.y / 2
		var half_camera_width = camera.size.x / 2
		
		var left_bound = camera_position.x - half_camera_width
		var right_bound = camera_position.x + half_camera_width
		var top_bound = camera_position.y + half_camera_height
		var bottom_bound = camera_position.y - half_camera_height
		
		"""
		example:
			position (0,0)
			size (1920, 1080)
			
			half_camera_height = 540
			half_camera_width = 960
			
			left_bound = -540
			right_bound = 540
			top_bound = 960
			bottom_bound = -960
		"""
		
		# check if potion is outside camera
		if position.x < left_bound or position.x > right_bound or position.y < bottom_bound or position.y > top_bound:
			# remove potion
			queue_free()

func _on_body_entered(body: Node2D) -> void:
	# if potion hit enemy
	if enemyName in body.name:
		# remove enemy
		body.queue_free()
	# remove potion
	queue_free()
