extends Area2D

signal leaving_level

func _on_Exit_body_entered(body):
	if body.is_in_group("Player"):
		body.score += 1
	emit_signal("leaving_level")

