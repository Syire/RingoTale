extends CharacterBody2D
#@export var gravity =20
@export var speed=30
@export var player_chase=false
var player=null
var damage=1
@export var jump_force=-250
@export var contrast=100
@export var MaxHealth=1
@export var score=25
@onready var currentHealth:int =MaxHealth
@onready var sprite=$Sprite2D
func _physics_process(delta):
	if player_chase:
		position+=(player.position-position)/speed
		if player.position.x > position.x:
			switch_direction(1)  # Muovi verso destra
		else:
			switch_direction(-1)
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player") and not body.is_in_group("enemy"):
		player=body
		player_chase=true

func switch_direction(horizontal_direction):
	sprite.flip_h=(horizontal_direction == -1)

func _on_area_2d_body_exited(body):
	player=null
	player_chase=false

func take_damage1(amount):
	currentHealth-=1
	die()

func die():
	queue_free()

	
func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(damage)



