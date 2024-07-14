extends Node2D
@export var player_chase=false
var player=null
var text_label
var x
var y
var label_pos
var text
var perga=false
var start=false
var show=false
func _ready():
	text_label=$Area2D/Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_chase:
		text_label=label_pos
		text_label.text = text
		if start==false:
			if perga==true:
				if Input.is_action_just_pressed("Enter") and show==false:
					$Area2D4/Sprite2D.show()
					show=true
					$Player.jump_force=0
					$Player.speed=0
				elif Input.is_action_just_pressed("Enter") and show==true:
					$Area2D4/Sprite2D.hide()
					show=false
					$Player.jump_force=-300
					$Player.speed=150
			elif perga==false:
				if Input.is_action_just_pressed("Enter"):
					player.position.x=x
					player.position.y=y
			#get_tree().change_scene_to_file("res://scenes/world.tscn")
		elif start==true:
			#text_label.text=""
			text_label=label_pos
			if Input.is_action_just_pressed("start_l") and show==false:
				$Area2D3/level_menu.show()
				show=true
				$Player.jump_force=0
				$Player.speed=0
			elif Input.is_action_just_pressed("start_l") and show==true:
				$Area2D4/level_menu.hide()
				show=false
				$Player.jump_force=-300
				$Player.speed=150
	else:
		text_label.text=""

func _on_area_2d_body_entered(body):
	player=body
	player_chase=true
	label_pos=$Area2D/Label
	text="H"
	x=989
	y=24


func _on_area_2d_body_exited(body):
	player=null
	player_chase=false


func _on_area_2d_2_body_entered(body):
	player=body
	player_chase=true
	text="H"
	label_pos=$Area2D2/Label
	x=227
	y=24


func _on_area_2d_2_body_exited(body):
	player=null
	player_chase=false


func _on_area_2d_3_body_entered(body):
	player=body
	player_chase=true
	text="Enter"
	label_pos=$Area2D3/Label
	start=true

func _on_area_2d_3_body_exited(body):
	player=null
	player_chase=false
	start=false



func _on_area_2d_4_body_entered(body):
	player=body
	player_chase=true
	text="interact[H]"
	label_pos=$Area2D4/Label
	perga=true



func _on_area_2d_4_body_exited(body):
	player=null
	player_chase=false
	perga=false
