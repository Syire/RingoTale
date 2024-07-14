extends Node2D
@export var player_chase=false
@export var player_chase2=false
@export var amount=0
var bottola=false
var player=null
var Ctext=""
var count=0
# Called when the node enters the scene tree for the first time.
func _ready():
	bottola=Global.bottola
	print(bottola)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_chase:
		$cartello.text=str(Ctext)
		if Input.is_action_pressed("Enter") and count==0:
			$Label.show()
			amount=1
			$Timer.start()
			bottola=true
			Global.bottola=bottola
		elif Input.is_action_pressed("Enter") and count==1:
			$Label.hide()
			amount=(-1)
			$Timer.start()
	else:
		$cartello.text=str(Ctext)
	if bottola == true:
		$Botola.show()
		$Botola/botola/CollisionShape2D.set_deferred("disabled",false)
		if player_chase2:
			$botola.text=str(Ctext)
			if Input.is_action_pressed("start_l"):
				Global.bottola=false
				get_tree().change_scene_to_file("res://scenes/floor1.tscn")
		else:
			$botola.text=str(Ctext)


func _on_area_2d_body_entered(body):
	player=body
	player_chase=true
	Ctext="PRESS [H]"


func _on_area_2d_body_exited(body):
	player=null
	player_chase=false
	Ctext=""



func _on_timer_timeout():
	count+=amount
	$Timer.stop()


func _on_botola_body_entered(body):
	player=body
	player_chase2=true
	Ctext="PRESS [ENTER]"

func _on_botola_body_exited(body):
	player=null
	player_chase2=false
	Ctext=""
