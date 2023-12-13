extends Sprite2D
var cDialogue
var index = 0
var reference

signal dialogueEnded()

func setText(code):
	$RichTextLabel.show()
	index = 0
	
	for dialogue in reference:
		if dialogue.code == code:
			cDialogue = dialogue
			var speech = dialogue.content
			readText(speech, index)

func convertText(ref):
	var arquivo = FileAccess.get_file_as_string(ref)
	var jsonObj = JSON.new()
	var error = jsonObj.parse(arquivo)
	
	reference = jsonObj.data

func readText(reference, index):
	$RichTextLabel.text = reference[index].text
	frame = reference[index].frame

func _on_button_pressed():
	index += 1
	if len(cDialogue.content) <= index:
		closeText()
		return
	readText(cDialogue.content, index)

func closeText():
	emit_signal('dialogueEnded', cDialogue.code)
	$RichTextLabel.hide()
	frame = 0
