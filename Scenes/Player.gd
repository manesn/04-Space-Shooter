extends KinematicBody2D

export var health = 100
export var score = 0
export var margin = 5
export var y_range = 150
export var acceleration = 0.1

var velocity = Vector2(0,0)
onready var VP = get_viewport_rect().size

onready var Bullet = load("res://Scenes/Bullet_B.tscn")

signal health_changed
signal score_changed


func _ready():
	emit_signal("health_changed")
	emit_signal("score_changed")


func change_health(h):
	health += h
	emit_signal("health_changed")
	if health <= 0:
		die()

func change_score(s):
	score += s
	emit_signal("score_changed")

func die():
	queue_free()

func _physics_process(delta):
	if Input.is_action_pressed("Left"):
		position.x = position.x - 10
	if Input.is_action_pressed("Right"):
		position.x = position.x - -10
	if Input.is_action_pressed("Up"):
		position.y = position.y - 10
	if Input.is_action_pressed("Down"):
		position.y = position.y - -10
	if Input.is_action_pressed("Shoot"):
		var bullet = Bullet.instance()
		bullet.position=position
		get_node("/root/Game/Bullets").fire(bullet)
		
var collision = move_and_collide(velocity)
