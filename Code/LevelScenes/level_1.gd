extends Node2D

var currentComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	$InfoText.setData("res://Code/Text/componentsDescriptionLevel1.json")
	
	$Character.convertText("res://Code/Text/characterLinesLevel1.json")
	$Character.setText("01_intro")
	$Character.connect("dialogueEnded", dialogueEnded)
	
	$"Component-Level1".connect("componentClicked", componentClicked)
	
	$Transition.stay('IN', 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.'
func _process(delta):
	pass

func dialogueEnded(code):
	print(code)
	if code == '01_intro':
		$InfoText.setText('CPU')
		currentComponent = 'CPU'
	elif code == '01_CPU_done':
		$InfoText.setText('Inputs')
		currentComponent = 'Inputs'
	elif code == '01_Inputs_done':
		$InfoText.setText('ForcaDaCPU')
		currentComponent = 'ForcaDaCPU'
	elif code == '01_ForcaDaCPU_done':
		$InfoText.setText('ControladorEntradaESaida')
		currentComponent = 'ControladorEntradaESaida'
	elif code == '01_ControladorEntradaESaida_done':
		$InfoText.setText('CPUFan')
		currentComponent = 'CPUFan'
	elif code == '01_CPUFan_done':
		$InfoText.setText('EntradaDeForca')
		currentComponent = 'EntradaDeForca'
	elif code == '01_EntradaDeForca_done':
		$InfoText.setText('EntradaPlacaDeVideo')
		currentComponent = 'EntradaPlacaDeVideo'
	elif code == '01_EntradaPlacaDeVideo_done':
		$InfoText.setText('ChipSet')
		currentComponent = 'ChipSet'
	elif code == '01_ChipSet_done':
		$InfoText.setText('Bateria')
		currentComponent = 'Bateria'
	elif code == '01_Bateria_done':
		$InfoText.setText('EntradaSATA')
		currentComponent = 'EntradaSATA'
	elif code == '01_EntradaSATA_done':
		$InfoText.setText('M2M')
		currentComponent = 'M2M'
	elif code == '01_M2M_done':
		$InfoText.setText('RAM')
		currentComponent = 'RAM'
	elif code == '01_RAM_done':
		$InfoText.setText('SysFan')
		currentComponent = 'SysFan'
	elif code == '01_SysFan_done':
		$Transition.stay('OUT', 0.5)
		$Transition.connect('faded_in', Callable(self, 'exitLevel'))

func componentClicked(component):
	if component == currentComponent:
		$"Component-Level1".componentDone(component)
		$Character.setText("01_" + component + "_done")

func exitLevel():
	get_tree().change_scene_to_file("res://Code/LevelScenes/level_2.tscn")
