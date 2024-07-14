extends Node2D

@export var player_chase = false
var Player = null
var button
var labeltext=""
@onready var timer = $Timerbutton

func _ready():
	var player_position = Global.load_player_position()
	#if player_position != Vector2.ZERO:
	#	$PlayerTD.position = player_position

func _process(delta):
	if player_chase:
		if button==$ACT and Input.is_action_pressed("start_l"):
			act_function()
		elif button==$FIGHT and Input.is_action_pressed("start_l"):
			$"../Label2".text=str(labeltext)
			$"../Label2".show()
			timer.start()
		elif button==$ITEM and Input.is_action_pressed("start_l"):
			$"../Label2".text=str(labeltext)
			$"../Label2".show()
			timer.start()
		elif button==$MERCY and Input.is_action_pressed("start_l"):
			mercy_function()
			#end_battle()
func _on_area_act_body_entered(body):
	Player = body
	player_chase = true
	button = $ACT
	button.frame = 1 

func _on_area_act_body_exited(body):
	Player = null
	player_chase = false
	button.frame = 0 
	button=null

func _on_area_fight_body_entered(body):
	Player = body
	player_chase = true
	button = $FIGHT
	button.frame = 1 
	labeltext="NO! SIAMO IN PACIFIST!!!"

func _on_area_fight_body_exited(body):
	Player = null
	player_chase = false
	button.frame = 0 
	button=null
	labeltext=""

func _on_area_item_body_entered(body):
	Player = body
	player_chase = true
	button = $ITEM
	button.frame = 1
	labeltext="NO! I CHAD NON USANO \n ITEM PER VINCERE!"

func _on_area_item_body_exited(body):
	Player = null
	player_chase = false
	button.frame = 0
	button=null
	labeltext=""

func _on_area_mercy_body_entered(body):
	Player = body
	player_chase = true
	button = $MERCY
	button.frame = 1

func _on_area_mercy_body_exited(body):
	Player = null
	player_chase = false
	button.frame = 0
	button=null

func buttoncol_off():
	$"./ACT/AreaAct/act".set_deferred("disabled",true)
	$"./FIGHT/AreaFight/fight".set_deferred("disabled",true)
	$"./ITEM/AreaItem/item".set_deferred("disabled",true)
	$"./MERCY/AreaMercy/mercy".set_deferred("disabled",true)

func act_function():
	$"../act/GridContainer/Label/Area2Dfirst/1".set_deferred("disabled", false)
	$"../act/GridContainer/Label2/Area2Dsecond/2".set_deferred("disabled", false)
	$"../act/GridContainer/Label3/Area2Dthird/3".set_deferred("disabled", false)
	$"../act/GridContainer/Label4/Area2Dfourth/4".set_deferred("disabled", false)
	$"../act/GridContainer/Label5/Area2DFifth/5".set_deferred("disabled", false)
	$"../act/GridContainer".show()
	$".".hide()
	buttoncol_off()



func mercy_function():
	$"../mercy/GridContainer2/spare/spareArea/spa".set_deferred("disabled",false)
	$"../mercy/GridContainer2/return/returnArea/ret".set_deferred("disabled",false)
	$"../mercy".show()
	$".".hide()
	buttoncol_off()

func end_battle():
	get_tree().change_scene_to_file("res://scenes/UnderLevel1.tscn")

func _on_timer_timeout():
	$"../Label2".text=""
	$"../Label2".hide()
	timer.stop()
