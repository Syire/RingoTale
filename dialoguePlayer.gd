extends CanvasLayer

export(String, FILE, "*.json") var d_file

var dialogue=[]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	start()
func start():
	dialogue=load_dialogue()
	$NinePatchRect/name.text=dialogue[0]['name']
	$NinePatchRect/name.text=dialogue[0]['text']
func load_dialogue():
	var file=file.new()
	if file.file_exists(d_file):
		file.open(d_file.file.READ)
		return parse_json(file.get_as_text())
