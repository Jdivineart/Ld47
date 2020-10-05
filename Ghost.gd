extends Area2D




func _on_Ghost_body_entered(body):
	if "Player" in body.name:
		get_tree().quit()
