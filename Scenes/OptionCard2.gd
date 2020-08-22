extends AnimatedSprite

func _ready():
	pass # Replace with function body.

func _on_OptionCard2Area_mouse_entered():
	$Peak.play("Peak")


func _on_OptionCard2Area_mouse_exited():
	$Peak.play_backwards("Peak")
