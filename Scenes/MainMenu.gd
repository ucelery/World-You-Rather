extends Node2D

var starting = false

func _ready():
	$Tutorial.hide()

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if !starting:
				starting = true
				$Label/AnimationPlayer.play("FastBlinking")
				$UpContainer/AnimationPlayer.play("Drag Up")
				$Fade/AnimationPlayer.play("Fade")
				$Woosh.play()
				$Timer.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	$UpContainer/AnimationPlayer.stop(true)
	$GameTitle.hide()
	$Label.hide()
	$Tutorial.show()
	$Tutorial.set_process_input(true)
	$Tutorial/Load.play("Load")


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()

func _on_Timer_timeout():
	$Woosh.stop()
