extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	$AudioStreamPlayer2D.playing = true
	$Timer.start(0.5)
	


func _on_Exit_pressed():
	$AudioStreamPlayer2D.playing = true
	get_tree().quit()


func _on_Timer_timeout():
	$AudioStreamPlayer2D.playing = false
	get_tree().change_scene("res://World.tscn")
	
