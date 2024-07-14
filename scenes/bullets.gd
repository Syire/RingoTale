extends Area2D

var vel = Vector2()
@export var player_chase = false
var Player = null
@export var player_chase2 = false
var Player2 = null
@export var speed = 75
@onready var ap=$AnimationPlayer
var damage=1
@onready var attack_timer = $Timer  # Assicurati che il percorso del nodo Timer sia corretto


func animation():
	ap.play("attack")

func ready():
	set_physics_process(true)

	

func startat(dir, pos):
	set_rotation(dir)
	set_position(pos)
	vel = Vector2(speed, 0).rotated(dir)

func _physics_process(delta):
	animation()
	if player_chase2:
		position+=(Player2.position-position)/speed

func _on_timer_timeout():
	if player_chase and Player:
		Player.take_damage(damage)
		$attack.show()


func _on_attack_body_entered(body):
	if body.is_in_group("soul"):
		Player=body
		player_chase=true
		$attack.hide()
		attack_timer.start()


func _on_attack_body_exited(body):
	Player = null
	player_chase = false
	$attack.show()
	attack_timer.stop()



func _on_body_entered(body):
	Player2=body
	player_chase2=true

func _on_body_exited(body):
	Player2=null
	player_chase2=false
