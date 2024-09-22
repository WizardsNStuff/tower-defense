extends Button
@onready var quitBtnBG = $"../../../../../QuitBtn2BG"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



# terminate program when quit is clicked
func _on_pressed() -> void:
	print("quit")
	get_tree().quit()

# enable background when hovering over button area 
func _on_mouse_entered() -> void:
	quitBtnBG.visible = true

# disable background when hovering over button area
func _on_mouse_exited() -> void:
	quitBtnBG.visible = false
