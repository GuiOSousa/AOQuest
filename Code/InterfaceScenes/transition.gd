extends CharacterBody2D

var direction = Vector2.ZERO
var state = 'OUT'
var fading = 'IN'

signal faded_in()

func _ready():
	pass

func _physics_process(delta):
	move(delta)

func stay(newState, time):
	state = newState
	if state == 'IN':
		show()
		direction = Vector2.ZERO
		position = Vector2(0, 0)
	elif state == ('OUT'):
		direction = Vector2.ZERO
		position = Vector2(1272, 0)
	$Timer2.start(time)

func fadeIn():
	fading = 'IN'
	$Timer.start(1.18)
	show()
	position = Vector2(1272, 0)
	direction = Vector2(-1, 0)

func fadeOut():
	fading = 'OUT'
	$Timer.start(1.5)
	show()
	position = Vector2(0, 0)
	direction = Vector2(-1, 0)

func move(delta):
	velocity = direction * delta * 3600 * 1 * 18
	move_and_slide()

func _on_timer_timeout():
	direction = Vector2.ZERO
	hide()
	if fading == 'IN':
		emit_signal("faded_in")

func _on_timer_2_timeout():
	if state == 'IN':
		fadeOut()
	else:
		fadeIn()
