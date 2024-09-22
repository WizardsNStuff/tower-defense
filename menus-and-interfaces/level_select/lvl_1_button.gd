extends Button
@onready var lvl1BtnBG = $"../../../../../Level1BtnBG"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_mouse_entered() -> void:
	lvl1BtnBG.visible = true


func _on_mouse_exited() -> void:
	lvl1BtnBG.visible = false
