extends HBoxContainer

@onready var HeartGuiClass=preload("res://scenes/heart_gui.tscn")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setMaxHearts(max:int):
	for i in range(max):
		var heart=HeartGuiClass.instantiate()
		add_child(heart)
		
func updateHearts(currentHealth:int):
	var hearts=get_children()
	for i in range(currentHealth):
		hearts[i].update(true)
	for i in range(currentHealth,hearts.size()):
		hearts[i].update(false)

