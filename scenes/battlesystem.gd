extends Node2D

@onready var HeartContainer=$Heart_box
@onready var soul=$Soul
@onready var music=$AudioStreamPlayer2D
@onready var buttons =$Button
@export var player_chase=false
@onready var acting = $ActionSelector
@onready var items = $ItemSelector
@onready var enemies = $EnemyUnd

var Player=null

var selection
var function
var Data
func _ready():
	$AudioStreamPlayer2D.play()
	Data = load("res://savedata/Data.gd").new()
	add_child(Data)
	Data.custom_method()
	$Label.text = Data.human
	
	playersTurn()
	HeartContainer.setMaxHearts(soul.MaxHealth)
	HeartContainer.updateHearts(soul.currentHealth)
	soul.healthChanged.connect(HeartContainer.updateHearts)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func playersTurn(reset_line = true):
	buttons.enable(soul)
	await buttons.select
	#blitter.feed(["", null, null, true])
	
	function = buttons.selection()
	match function:
		"Fight", "Act", "Mercy":
			target()
		"Item":
			if Data.items.is_empty():
				playersTurn(false)
				return
			items.enable(soul)
			await items.select
			if items.enable:
				items.enable = false
				playersTurn()
				return

func target():
	enemies.enable(soul)
	await enemies.select
	selection = enemies.selection()
	
	if enemies.enable:
		enemies.enable = false
		playersTurn()
		return
	
	match function:
		"Fight":
			buttons.turn_off()
			pass
		"Act":
			acting.list = selection.actings
			#blitter.feed([acting.string(), null, null, true])
			acting.enable(soul)
			await acting.select
			
			if acting.enable:
				acting.enable = false
				target()
				return
			
			buttons.turn_off()
			var get_act_string = selection.acting(acting.selection)
			
		"Mercy":
			buttons.turn_off()
			if selection.spareable:
				selection.spare()
			#blitter.feed(["", null, null, true])
			enemysTurn()


func enemysTurn():
	#enemies.cutscene(box)
	await enemies.cutscene_end
	
	enemies.attack()
	await enemies.cutscene_end
	
	soul.changeMovement("")
	playersTurn()
