extends Button

@onready var quitBtnBG = get_node("/root/MainMenu/QuitBtnBG")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass




func _on_pressed() -> void:
	get_tree().quit()


func _on_mouse_entered() -> void:
	quitBtnBG.visible = true


func _on_mouse_exited() -> void:
	quitBtnBG.visible = false
