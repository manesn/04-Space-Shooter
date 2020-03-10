extends KinematicBody2D


func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x = position.x - 10
	if Input.is_action_pressed("ui_right"):
		position.x = position.x - -10
	if Input.is_action_pressed("ui_up"):
		position.y = position.y - 10
	if Input.is_action_pressed("ui_down"):
		position.y = position.y - -10
