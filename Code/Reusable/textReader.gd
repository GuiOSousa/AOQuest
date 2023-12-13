extends Node
class_name TextReader

func convertText(path):
	var file = FileAccess.get_file_as_string(path)
	var jsonObject = JSON.new()
	var error = jsonObject.parse(file)
	
	print(jsonObject.data)
	return jsonObject.data

func setText(code, data):
	for dialogue in data:
		if dialogue.code == code:
			return dialogue.content
