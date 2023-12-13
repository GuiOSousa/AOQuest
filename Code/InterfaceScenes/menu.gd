extends Node2D

func _ready():
	$Transition.stay('IN', 1)

func _on_button_pressed():
	$Transition.fadeIn()
	$Transition.connect("faded_in", Callable(self, 'exitMenu'))

func _on_color_rect_mouse_exited():
	$ColorRect.hide()

func _on_button_3_pressed():
	$ColorRect.show()

func exitMenu():
	get_tree().change_scene_to_file("res://Code/LevelScenes/level_1.tscn")
