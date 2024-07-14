extends Node2D
var tokens=0
@export var player_chase=false
var Player=null

@onready var coll=$flevel/CollisionShape2D
@onready var nextcoll=null
var cap=0
var verify=1
var label_pos
var text
var text_label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_chase:
		text_label=label_pos
		text_label.text=text
		if Input.is_action_just_pressed("Enter") and verify==1:
			get_tree().change_scene_to_file("res://scenes/UnderLevel1.tscn")
			#get_tree().change_scene_to_file("res://scenes/hotel.tscn")
		elif Input.is_action_just_pressed("Enter") and verify==2:
			get_tree().change_scene_to_file("res://scenes/world.tscn")
	else:
		text_label=label_pos
		text_label.text=text
	if tokens>=cap:
		coll.show()

func _on_flevel_body_entered(body):
	Player=body
	player_chase=true
	nextcoll=$flevel2/CollisionShape2D
	text="press H"
	label_pos=$flevel/enter
	tokens+=1
	verify=1

func _on_flevel_body_exited(body):
	Player=null
	player_chase=false
	coll=nextcoll
	text=""


func _on_flevel_2_body_entered(body):
	Player=body
	player_chase=true
	nextcoll=$flevel3/CollisionShape2D
	text="press H"
	label_pos=$flevel2/enter
	tokens+=1
	verify=2

func _on_flevel_2_body_exited(body):
	Player=null
	player_chase=false
	coll=nextcoll
	text=""
