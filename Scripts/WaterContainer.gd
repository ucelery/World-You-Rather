extends Node2D

func _ready():
	pass

func _process(delta):
	if (Input.is_action_just_pressed("ui_up")):
		Global.water_level -= 1
		if (Global.water_level <= 1):
			$WATER2
