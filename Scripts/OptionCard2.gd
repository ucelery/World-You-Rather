	extends AnimatedSprite

var clicked = false
var enter = true

func _ready():
	pass # Replace with function body.

func _on_OptionCard2Area_mouse_entered():
	if (!clicked):
		if (!enter):
			if (position.y >= 460):
				$Peak.play("Peak")

func _on_OptionCard2Area_mouse_exited():
	if (!clicked):
		if (!enter):
			$Peak.play_backwards("Peak")

func _on_Cards_click():
	clicked = true

func _on_Enter_timeout():
	enter = false
