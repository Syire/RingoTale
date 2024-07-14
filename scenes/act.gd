extends Node2D


@export var player_chase4 = false
var Player = null
var button
var labelenemy=""
var back=false
var act=false

var verifyc=0
@onready var act_timer = $TimerAct

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_chase4:
		if Input.is_action_just_pressed("start_l") and act==true:
			$"../Soul".position.x=260
			$"../Soul".position.y=170
			$GridContainer.hide()
			$Label.text="Pingustar:"+labelenemy
			$"../mercy".actPositive+=verifyc
			$"../Bullets".show()
			$"../Bullets/CollisionShape2D".set_deferred("disabled", false)
			act_timer.start()
		elif Input.is_action_just_pressed("start_l") and back==true and act==false:
			$"../Button".show()
			$".".hide()
			back=false
			buttoncol_on()
			

func _on_area_2_dfirst_body_entered(body):
	Player = body
	player_chase4 = true
	$GridContainer/Label.set("theme_override_colors/font_color", Color(1, 0, 0))
	labelenemy="Il pingustar è felice. Decide di cantare insieme a te."
	act=true
	verifyc=1

func _on_area_2_dfirst_body_exited(body):
	Player = null
	player_chase4 = false
	$GridContainer/Label.set("theme_override_colors/font_color", Color(255, 255, 255))
	act=false
	verifyc=0

func _on_area_2_dsecond_body_entered(body):
	Player = body
	player_chase4 = true
	$GridContainer/Label2.set("theme_override_colors/font_color", Color(1, 0, 0))
	labelenemy="Il pingustar si è arrabbiato perché hai provato a \ntogliere i suoi occhiali!"
	act=true
	verifyc=(-1)

func _on_area_2_dsecond_body_exited(body):
	Player = null
	player_chase4 = false
	$GridContainer/Label2.set("theme_override_colors/font_color", Color(255, 255, 255))
	act=false
	verifyc=0

func _on_area_2_dthird_body_entered(body):
	Player = body
	player_chase4 = true
	$GridContainer/Label3.set("theme_override_colors/font_color", Color(1, 0, 0))
	labelenemy="Pingustar si è offeso, ma ti chiedi il perchè..."
	act=true
	verifyc=(-1)

func _on_area_2_dthird_body_exited(body):
	Player = null
	player_chase4 = false
	$GridContainer/Label3.set("theme_override_colors/font_color", Color(255, 255, 255))
	act=false
	verifyc=0

func _on_area_2_dfourth_body_entered(body):
	Player = body
	player_chase4 = true
	$GridContainer/Label4.set("theme_override_colors/font_color", Color(1, 0, 0))
	labelenemy="Il pingustar è molto contento che tu lo hai riconosciuto \n e decide di farti l'autografo"
	act=true
	verifyc=1

func _on_area_2_dfourth_body_exited(body):
	Player = null
	player_chase4 = false
	$GridContainer/Label4.set("theme_override_colors/font_color", Color(255, 255, 255))
	act=false
	verifyc=0

func _on_timer_timeout():
	$"../Bullets".hide()
	$"../Bullets/CollisionShape2D".set_deferred("disabled", true)
	$"../Bullets".position.x=132
	$"../Bullets".position.y=111
	$"GridContainer/Label/Area2Dfirst/1".set_deferred("disabled",true)
	$"GridContainer/Label2/Area2Dsecond/2".set_deferred("disabled",true)
	$"GridContainer/Label3/Area2Dthird/3".set_deferred("disabled",true)
	$"GridContainer/Label4/Area2Dfourth/4".set_deferred("disabled",true)
	$"GridContainer/Label5/Area2DFifth/5".set_deferred("disabled",true)
	$Label.text=""
	$"../Button".show()
	$"../Soul".position.x=71
	$"../Soul".position.y=254
	buttoncol_on()
	act_timer.stop()

func _on_area_2d_fifth_body_entered(body):
	Player = body
	player_chase4 = true
	$GridContainer/Label5.set("theme_override_colors/font_color", Color(1, 0, 0))
	back=true
	act=false

func _on_area_2d_fifth_body_exited(body):
	Player = null
	player_chase4 = false
	$GridContainer/Label5.set("theme_override_colors/font_color", Color(255, 255, 255))
	back=false
	act=false

func buttoncol_on():
	$"../Button/ACT/AreaAct/act".set_deferred("disabled",false)
	$"../Button/FIGHT/AreaFight/fight".set_deferred("disabled",false)
	$"../Button/ITEM/AreaItem/item".set_deferred("disabled",false)
	$"../Button/MERCY/AreaMercy/mercy".set_deferred("disabled",false)

