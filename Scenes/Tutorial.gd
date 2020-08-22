extends Node2D

func _ready():
	set_process_input(false)

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			get_tree().change_scene("res://Scenes/Main.tscn")
