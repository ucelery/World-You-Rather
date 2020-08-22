extends Node2D

onready var colLeft = $CardContainer/OptionCard1/OptionCard1Area/CollisionShape2D
onready var colRight = $CardContainer2/OptionCard2/OptionCard2Area/CollisionShape2D

func _ready():
	colLeft.position.x = -2000
	colRight.position.x = -2000
	$Loaded.start()
	$CardContainer2/OptionCard2/AnimationPlayer.play("UpCard")
	$CardContainer/OptionCard1/AnimationPlayer.play("Up2")

func _on_OptionCard2Area_mouse_entered():
	pass

func _on_Loaded_timeout():
	colLeft.position.x = 329.639
	colRight.position.x = 639.491
	$Loaded.stop()
