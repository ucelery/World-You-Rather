extends Node2D

func _ready():
	
	
	$Cards/Card1.position.x = 2000
	$Cards/Card2.position.x = 1900
	$Cards/Card3.position.x = 1800
	$Cards/Card4.position.x = 1700
	$Cards/Card5.position.x = 1600
	
	$Cards/Card6.position.x = 1500
	$Cards/Card7.position.x = 1400
	$Cards/Card8.position.x = 1300
	$Cards/Card9.position.x = 1200
	$Cards/Card10.position.x = 1100
	
	$Cards/Card11.position.x = 1000
	$Cards/Card12.position.x = 900
	$Cards/Card13.position.x = 800
	$Cards/Card14.position.x = 700
	$Cards/Card15.position.x = 600
	
	$Cards/Card16.position.x = 500
	$Cards/Card17.position.x = 400
	$Cards/Card18.position.x = 300
	$Cards/Card19.position.x = 200
	$Cards/Card20.position.x = 100
	


func _on_Area2D_mouse_entered():
	$Cards/Peak.play("Card1")

func _on_Area2D2_mouse_entered():
	$Cards/Peak.play("Card2")
	
