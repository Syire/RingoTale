extends CharacterBody2D

@export var speed =150
@export var run_speed =250
@export var gravity =20
@export var jump_force =-350
@export var double_jump_force = -350
@export var jump_count =0
@export var max_jump=2
@export var attacking=false
@export var run=false
@onready var ap=$AnimationPlayer
@onready var sprite=$Sprite2D
@export var MaxHealth=5
@onready var currentHealth:int =MaxHealth
@onready var heart=$HBoxContainer
@export var MaxScore=0
@onready var die_text=$Label
@onready var currentScore:int =MaxScore
@onready var score=$HBoxContainer
var damage=1

signal healthChanged
signal ScoreChanged

func _physics_process(delta):
	velocity.y+=gravity
	if is_on_floor():
		jump_count=0
	if Input.is_action_just_pressed("move_jump") and jump_count<max_jump:
		velocity.y=jump_force
		jump_count+=1
	if Input.is_action_pressed("move_attack"):
		attacky()
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	if Input.is_action_pressed("running"):
		velocity.x=run_speed*horizontal_direction
		run=true
	#elif Input.is_action_just_released("running"):
	else:
		velocity.x=speed * horizontal_direction
		run=false
	#velocity.x=speed * horizontal_direction
	if horizontal_direction !=0:
		switch_direction(horizontal_direction)
	move_and_slide()
	
	update_animation(horizontal_direction)

func attacky():
	attacking=true
	ap.play("attack1")

func update_animation(horizontal_direction):
	if !attacking:
		if is_on_floor():
			if horizontal_direction==0:
				ap.play("idle")
			else:
				if run==true:
					ap.play("run")
				else:
					ap.play("walk")
		else:
			if velocity.y<0:
				ap.play("jump")
			elif velocity.y>0:
				ap.play("fall")

func switch_direction(horizontal_direction):
	$Sprite2D/Area2D/Hit.position.x*=-1
	sprite.flip_h=(horizontal_direction == -1)
	

func take_damage(amount):
	currentHealth-=1
	position.y+=10
	if currentHealth<=0:
		#die()
		position.x=160
		position.y=110
		currentHealth=MaxHealth
	healthChanged.emit(currentHealth)


func die():
	#die_text.text = "YOUR DIED!"
	queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		body.take_damage1(damage)
		currentScore+=body.score
		#currentScore+=25
		ScoreChanged.emit(currentScore)
