extends Node2D

var Gameover = false
var canMainmenu = false
onready var penguState = $Pengu/Animation
onready var factScene = preload("res://Scenes/Facts.tscn")
onready var sprite_ani = $Container/Sprite/AnimationPlayer
onready var situationScene = preload("res://Scenes/Cards.tscn")

func _ready():
	$Win.hide()
	$GameOver/Fade.hide()
	$GameOver/GMtxt.hide()
	$NewsFlash.play("0")
	Global.score = 0
	Global.turn = 0
	Global.water_level = 0

func updatePengu():
	if (Global.water_level <= 1):
		penguState.play("Swaying")
	elif (Global.water_level <= 2):
		penguState.play("Flap")
	elif (Global.water_level <= 3):
		penguState.play("Flapping")
	elif (Global.water_level <= 4):
		penguState.play("FastFlapping")
	elif (Global.water_level <= 6):
		penguState.play("ExtremeFlapping")

func updateScore():
	if (Global.score < 9):
		$Score/Label.text = "SCORE: 00000" + str(Global.score)
	elif (Global.score < 99):
		$Score/Label.text = "SCORE: 0000" + str(Global.score)
	elif (Global.score < 999):
		$Score/Label.text = "SCORE: 000" + str(Global.score)
	elif (Global.score < 9999):
		$Score/Label.text = "SCORE: 00" + str(Global.score)
	elif (Global.score < 99999):
		$Score/Label.text = "SCORE: 0" + str(Global.score)

func wrong():
	$Wrong.play()
	Global.water_level += 1
	updatePengu()
	if(!Gameover):
		$Timer.start()
		sprite_ani.play("Up")
		$WaterSFX.play(0.5)
		$WaterSFX/Timer.start()
	if(Global.water_level == 6):
		Gameover = true
		print("gm")
		remove_child($BackgroundMusic)
		$GameOver/Fade.show()
		$GameOver.play()
		$GameOver/GMtxt.show()
		$GameOver/Fade/AnimationPlayer.play("Fade")
	Global.turn += 1

func correct():
	var newFact = factScene.instance()
	add_child(newFact)
	$Correct.play()
	Global.score += 50
	if (!(Global.water_level <= 0)):
		sprite_ani.play_backwards("Up")
		$WaterSFX.play(0.5)
		$WaterSFX/Timer.start()
		Global.water_level -= 1
		updatePengu()
	$Timer.start()
	Global.turn += 1

func _input(event):
	if(canMainmenu):
		if event is InputEventMouseButton:
			if event.pressed:
				get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _process(delta):
	if(Input.is_action_just_pressed("ui_up")):
		$Container/Sprite/Timer.start()
		wrong();
	elif(Input.is_action_just_pressed("ui_down")):
		$Container/Sprite/Timer.start()
		correct();

func _on_AnimationPlayer_animation_finished(anim_name):
	pass

func _on_Timer_timeout():
	sprite_ani.stop(false);

func _on_Cards_click(checking):
	if(checking):
		correct()
	else: 
		wrong()
		if(Global.turn == 20):
			$Win.show()
			var correctSit = Global.score / 50
			$Win/ColorRect/Text.text = "good job!\nyou did something about " + str(correctSit) + "/20 situations!"
			$Win/Timer.start()
	if(Global.turn == 20):
		pass
	else:
		$NewsFlash.play(str(Global.water_level))
		$Timer2.start()
		$ClickSFX.play(0.20)
		updateScore()
		print("Turn: " + str(Global.turn))

func _on_WaterSFX_Timeout():
	if(!Gameover):
		$WaterSFX.stop()
	$WaterSFX/Timer.stop()

func _on_Timer2_timeout():
	if (!Gameover):
		var newSituation = situationScene.instance()
		add_child(newSituation)
		$Timer2.stop()

func _on_BackgroundMusic_finished():
	$BackgroundMusic.play()

func _on_GameOver_finished():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_Facts_win():
	$Win.show()
	var correctSit = Global.score / 50
	$Win/ColorRect/Text.text = "good job!\nyou did something about " + str(correctSit) + "/20 situations!"
	$Win/Timer.start()

var count = 3
func _on_TimerWIN_timeout():
	count -= 1
	if (count > 0):
		$Win/ColorRect/Label.text = str(count)
	else:
		$Win/ColorRect/Label.text = "click anywhere to continue"
		canMainmenu = true
		$Win/Timer.stop()
