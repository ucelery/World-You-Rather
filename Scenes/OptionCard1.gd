extends AnimatedSprite

func _ready():
	pass


func _on_OptionCard1Area_mouse_entered():
	$Peak.play("Peak")

func _on_OptionCard1Area_mouse_exited():
	$Peak.play_backwards("Peak")
