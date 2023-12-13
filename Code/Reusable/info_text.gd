extends RichTextLabel

var textReader = TextReader.new()
var textData

func _ready():
	fit_content = true

func setData(path):
	textData = textReader.convertText(path)

func setText(code):
	show()
	var textLine = textReader.setText(code, textData)
	text = textLine[0].text
