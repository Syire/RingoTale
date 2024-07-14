extends ColorRect

@onready var logo = $Sprite2D
@onready var an = $Sprite2D/AnimationPlayer
var timer : Timer = Timer.new()

func _ready():
	pass

func _process(delta):
	# La logica per avviare l'animazione e il timer dovrebbe essere spostata in un metodo separato
	if not timer.is_inside_tree():
		start_delay()

func start_delay():
	# Imposta il timer con un ritardo di 5 secondi
	timer.one_shot = true
	timer.autostart = false
	timer.wait_time = 10.0
	# Connette il segnale timeout a un nuovo metodo per cambiare la scena
	timer.connect("timeout", _on_timer_timeout)
	# Avvia il timer
	timer.start()
	# Avvia l'animazione
	first()

func first():
	# Avvia l'animazione
	an.play("first_scenes")


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

