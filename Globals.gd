extends Node

var player_position: Vector2 = Vector2.ZERO
var bottola=bool()

func _ready():
	print("Global script loaded")

func save_player_position(position: Vector2) -> void:
	var file = FileAccess.open("user://player_position.save", FileAccess.WRITE)
	if file:
		file.store_var(position)
		file.close()
	else:
		print("Errore nell'aprire il file per salvare la posizione del giocatore")

func load_player_position():
	var file = FileAccess.open("user://player_position.save", FileAccess.READ)
	if file:
		var position: Vector2 = file.get_var()
		file.close()
		return position
	else:
		print("Errore nell'aprire il file per caricare la posizione del giocatore")
		return Vector2.ZERO
