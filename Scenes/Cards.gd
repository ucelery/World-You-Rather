extends Node2D

signal click

var loading = true
var rng = RandomNumberGenerator.new()
var ready = false;
var checking = false

onready var col1 = $Options/CardContainer/OptionCard1/OptionCard1Area/CollisionShape2D
onready var col2 = $Options/CardContainer2/OptionCard2/OptionCard2Area/CollisionShape2D
onready var leftCard = $Options/CardContainer/OptionCard1
onready var rightCard = $Options/CardContainer2/OptionCard2

var correct

func _ready():
	col1.position.x = -20000
	col2.position.x = -20000
	
	loading = true
	checking = false
	
	self.connect("click", get_parent(), "_on_Cards_click")
	
	randomize()
	if (Global.sitArray.empty()):
		for i in range(20):
			Global.sitArray.append(i)
		Global.sitArray.shuffle()
		print(Global.sitArray)
	
	rng.randomize()
	correct = rng.randi_range(0, 1) # 0 = left | 1 = right
	

	$Situation/SituationCard.frame = Global.sitArray[Global.turn]
	if (correct == 0): # correct is left Card
		leftCard.animation = "right"
		rightCard.animation = "wrong"
		leftCard.frame = Global.sitArray[Global.turn]
		rightCard.frame = Global.sitArray[Global.turn]
	elif (correct == 1): # correct is right
		rightCard.animation = "right"
		leftCard.animation = "wrong"
		leftCard.frame = Global.sitArray[Global.turn]
		rightCard.frame = Global.sitArray[Global.turn]

func _on_OptionCard1Area_click():
	if (correct == 0):
		checking = true
	col1.position.x = -20000
	col2.position.x = -20000
	$Options/Leave.play("Leave")
	$Situation/Leave.play("Leave")
	emit_signal("click", checking)
	
func _on_OptionCard2Area_click():
	if (correct == 1):
		checking = true
	col1.position.x = -20000
	col2.position.x = -20000
	$Options/Leave.play("Leave")
	$Situation/Leave.play("Leave")
	emit_signal("click", checking)

func _on_Leave_animation_finished(anim_name):
	queue_free()

func _on_TimerSFX_timeout():
	$AudioStreamPlayer2D.play()
