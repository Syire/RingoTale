extends Node2D

@export var player_chase = false
var Player = null
var actPositive=int(0)
var back=false
var mercy=false

@onready var mercy_timer=$mercytimer

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$"../Bullets/CollisionShape2D".set_deferred("disabled", true)
	if player_chase and mercy==true:
		if Input.is_action_pressed("start_l") and actPositive!=5 and back==false:
			$GridContainer2/spare.set("theme_override_colors/font_color", Color(255, 255, 255))
			$"../Label2".text="Non vuole essere \n risparmiato"
			mercy_timer.start()
		elif actPositive==5 and back==false:
			funmercy()
			if Input.is_action_pressed("start_l"):
					get_tree().change_scene_to_file("res://scenes/UnderLevel1.tscn")
		elif Input.is_action_pressed("start_l") and back==true:
			$".".hide()
			back=false
			$"../mercy/GridContainer2/spare/spareArea/spa".set_deferred("disabled",true)
			$"../mercy/GridContainer2/return/returnArea/ret".set_deferred("disabled",true)
			$"../Button".show()
			buttoncol_on()

func buttoncol_on():
	$"../Button/ACT/AreaAct/act".set_deferred("disabled",false)
	$"../Button/FIGHT/AreaFight/fight".set_deferred("disabled",false)
	$"../Button/ITEM/AreaItem/item".set_deferred("disabled",false)
	$"../Button/MERCY/AreaMercy/mercy".set_deferred("disabled",false)

func funmercy():
	$GridContainer2/spare.set("theme_override_colors/font_color", Color(255, 255, 0))
	
func _on_spare_area_body_entered(body):
	Player = body
	player_chase = true
	mercy=true


func _on_spare_area_body_exited(body):
	Player = null
	player_chase = false
	mercy=false

func _on_mercytimer_timeout():
	$"../Label".text=""


func _on_return_area_body_entered(body):
	Player = body
	player_chase = true
	back=true
	mercy=true


func _on_return_area_body_exited(body):
	Player = null
	player_chase = false
	mercy=false
