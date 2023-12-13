extends Node2D

var currentComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	$InfoText.setData("res://Code/Text/componentsDescriptionLevel2.json")
	$InfoText.setText("teste")
	
	$Character.convertText("res://Code/Text/characterLinesLevel2.json")
	$Character.setText("intro")
	$Character.connect("dialogueEnded", dialogueEnded)
	
	$"Component-Level2".connect("componentClicked", componentClicked)

	$Transition.stay('IN', 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func dialogueEnded(code):
	print(code)
	if code == 'intro':
		$InfoText.setText('Entrada')
		currentComponent = 'Entrada'
	elif code == 'Entrada_done':
		$InfoText.setText('LogicaCombinacional')
		currentComponent = 'LogicaCombinacional'
	elif code == 'LogicaCombinacional_done':
		$InfoText.setText('MemoriaPrincipal')
		currentComponent = 'MemoriaPrincipal'
	elif code == 'MemoriaPrincipal_done':
		$InfoText.setText('Processador')
		currentComponent = 'Processador'
	elif code == 'Processador_done':
		$InfoText.setText('Registradores')
		currentComponent = 'Registradores'
	elif code == 'Registradores_done':
		$InfoText.setText('Saida')
		currentComponent = 'Saida'
	elif code == 'Saida_done':
		$InfoText.setText('UnidadeDeControle')
		currentComponent = 'UnidadeDeControle'
	elif code == 'UnidadeDeControle_done':
		$Transition.stay('OUT', 0.5)
		$Transition.connect('faded_in', Callable(self, 'exitLevel'))

func componentClicked(component):
	if component == currentComponent:
		$"Component-Level2".componentDone(component)
		$Character.setText(component + "_done")

func exitLevel():
	get_tree().change_scene_to_file("res://Code/InterfaceScenes/menu.tscn")
