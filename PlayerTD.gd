extends CharacterBody2D


@export var speed =150
@onready var ap=$AnimationPlayer
@onready var sprite=$Sprite2D

var player_position =$".".position

var step_counter := 0

const steps_for_encounter := 70

func _ready():
	var player_position: Vector2 = Global.load_player_position()
	if player_position != Vector2.ZERO:
		$".".position = player_position

func change_to_battle_scene():
	Global.save_player_position($".".position)
	get_tree().change_scene_to_file("res://scenes/battlesystem.tscn")

func _physics_process(delta):
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	var vertical_direction = Input.get_axis("move_up","move_down")
	velocity.x=speed * horizontal_direction
	if horizontal_direction !=0:
		step_counter += 1
		if step_counter >= steps_for_encounter:
			change_to_battle_scene()
		switch_direction(horizontal_direction)
	velocity.y=speed*vertical_direction
	#if vertical_direction !=0:
		
	move_and_slide()
	update_animation(horizontal_direction,vertical_direction)
	
func switch_direction(horizontal_direction):
	sprite.flip_h=(horizontal_direction == -1)
	
func update_animation(horizontal_direction,vertical_direction):
	if horizontal_direction==0 and vertical_direction==0:
		ap.play("idle")
	else:
		ap.play("walk")

