extends KinematicBody2D

var max_speed = 300
var acceleration = 1500
var motion = Vector2()
var score:int;

func get_axis():
	var axis = Vector2.ZERO
	axis.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	axis.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return axis.normalized()
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	var axis = get_axis()
	if axis == Vector2.ZERO:
		apply_friction(acceleration * delta)
	else:
		apply_movement(axis * acceleration * delta)
	motion = move_and_slide(motion)
	
	
	
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO
	
	
func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(max_speed)




