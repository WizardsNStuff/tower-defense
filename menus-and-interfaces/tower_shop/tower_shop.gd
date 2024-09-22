extends Control

var buttons: Array = []
var labels: Array = []
@onready var level_script : Node2D

func _ready() -> void:
	level_script = get_tree().current_scene
	
	var vbox_container = $ScrollContainer/ColorRect/VBoxContainer

	"""
	The filter() method takes a function and creates a 
	new array containing only the elements for which the function returns true
	"""
	labels = vbox_container.get_children().filter(func(node):
		return node is Label
	)
	
	for l in labels:
		var label_buttons = l.get_children().filter(func(node):
			return node is Button
		)
		buttons += label_buttons

	for btn : Button in buttons:
		btn.pressed.connect(_on_button_pressed.bind(btn))

func _on_button_pressed(button):
	#print("tower shop script: btn pressed!")
	level_script.initiate_build_mode(button.name)  # Call the function in the other script
