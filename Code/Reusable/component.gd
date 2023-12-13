extends Sprite2D

var styleBoxOnMouse = StyleBoxFlat.new()
var styleBoxOffMouse = StyleBoxEmpty.new()

signal clicked

func _ready():
	$Button.size = get_rect().size
	$Button.position = get_rect().size/-2
	$ColorRect.size = get_rect().size
	$ColorRect.position = get_rect().size/-2
	styleBoxOnMouse.bg_color.from_string('ffb63471', Color(1, 1, 1))

func _on_button_pressed():
	emit_signal("clicked", self.name)
	print(self.name)

func done():
	$Button.queue_free()
	$ColorRect.show()
