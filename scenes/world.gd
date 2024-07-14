extends Node2D

var total_enemy
var enemy
@onready var HeartContainer=$CanvasLayer/Heart_box
@onready var SContainer=$CanvasLayer/Control
@onready var player=$Player
@onready var Raid=$spawn
@onready var Raid2=$spawn2
@onready var Raid3=$spawn3
@onready var music=$AudioStreamPlayer2D
@export var player_chase=false
var Player=null
var label_pos
var text
var text_label
var door=false

func _ready():
	music.play()
	#music.loop()
	enemy=Raid.raid+Raid2.raid+Raid3.raid
	HeartContainer.setMaxHearts(player.MaxHealth)
	HeartContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(HeartContainer.updateHearts)

	SContainer.update_score(player.MaxScore)
	player.ScoreChanged.connect(SContainer.update_score)
	#player.kill.connect(totalenemy_update)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if total_enemy==0:
		$finished_level/TextureRect.show()
	if player_chase:
		text_label=label_pos
		text_label.text = text
		if door:
			if Input.is_action_just_pressed("start_l"):
				get_tree().change_scene_to_file("res://scenes/hotel.tscn")

func totalenemy_update(nt_enemy):
	total_enemy = enemy-nt_enemy
	#score_label.text = "Score: " + str(score)


func _on_finished_level_body_entered(body):
	Player=body
	player_chase=true
	label_pos=$finished_level/finished_level
	text="Press enter to finish"
	door=true



func _on_finished_level_body_exited(body):
	player=null
	player_chase=false
