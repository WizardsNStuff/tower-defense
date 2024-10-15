extends Sprite2D
class_name SlimeView

@export var slime : Slime

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position = slime.global_position
	
	
	# do a bunch of different things depending on the state of the slime
	pass
