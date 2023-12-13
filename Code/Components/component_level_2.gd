extends Node2D

signal componentClicked()

func _ready():
	for child in get_children():
		if child.get_script() != null:
			child.connect("clicked", componentClickedFunction)
	
func componentClickedFunction(component):
	emit_signal("componentClicked", component)

func componentDone(name):
	for child in get_children():
		if child.name == name and child.get_script() != null:
			child.done()
