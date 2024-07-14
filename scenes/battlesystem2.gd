
extends Node2D


@onready var HeartContainer=$Heart_box
@onready var soul=$Soul
@onready var music=$AudioStreamPlayer2D
@onready var buttons =$Button
@export var player_chase=false




var player_position = Vector2.ZERO # Inizializza la variabile

var Player=null


func _ready():
	$AudioStreamPlayer2D.play()
	HeartContainer.setMaxHearts(soul.MaxHealth)
	HeartContainer.updateHearts(soul.currentHealth)
	soul.healthChanged.connect(HeartContainer.updateHearts)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



