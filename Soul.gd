extends CharacterBody2D
@export var speed =150
@onready var ap=$AnimationPlayer
@export var MaxHealth=5
@onready var currentHealth:int =MaxHealth
@onready var heart=$HBoxContainer

signal healthChanged

func _physics_process(delta):
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	var vertical_direction = Input.get_axis("move_up","move_down")
	velocity.x=speed * horizontal_direction
	velocity.y=speed * vertical_direction
	#if vertical_direction !=0:
		
	move_and_slide()
	
func take_damage(amount):
	currentHealth-=1
	healthChanged.emit(currentHealth)
	if currentHealth==0:
		get_tree().change_scene_to_file("res://scenes/floor1.tscn")

func _on_timer_timeout():
	pass # Replace with function body.
