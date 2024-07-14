extends Control
@onready var player=$player
@onready var menu=$Menu

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()

func toggle():
	visible= !visible
	get_tree().paused=visible

func _on_floorf_pressed():
	toggle()
	get_tree().change_scene_to_file("res://scenes/floor1.tscn")

func _on_floors_pressed():
	toggle()
	get_tree().change_scene_to_file("res://scenes/floor2.tscn")

func _on_floort_pressed():
	toggle()
	get_tree().change_scene_to_file("res://scenes/floor3.tscn")

func _on_floorfo_pressed():
	toggle()
	get_tree().change_scene_to_file("res://scenes/floor4.tscn")

func _on_floorfi_pressed():
	toggle()
	get_tree().change_scene_to_file("res://scenes/floor5.tscn")
