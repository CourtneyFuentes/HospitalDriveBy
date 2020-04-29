extends KinematicBody2D
export var health = 100
export var score = 0
export var margin = 5
export var y_range = 300
export var accel = 0.1

var velocity = Vector2(0, 0)

onready var View = get_viewport_rect().size

onready var Projectile = load("res://Scenes/Projectile.tscn")

signal health_lost
signal score_gained

func _ready():
	emit_signal("health_lost")
	emit_signal("score_gained")

func change_health(h):
	health += h
	emit_signal("health_lost")
	if health <= 0:
		destroyed()

func change_score(s):
	score += s
	emit_signal("score_gained")

func destroyed():
	queue_free()
	get_tree().change_scene("res://Scenes/Game Over.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("Fire"):
		var b = Projectile.instance()
		b.position = position
		b.position.y -= 25
		get_node("/root/Game/Projectile").fire(b)
		
	if Input.is_action_pressed("Up"):
		velocity.y -= accel
	if Input.is_action_pressed("Down"):
		velocity.y += accel
	if Input.is_action_pressed("Left"):
		velocity.x -= accel
	if Input.is_action_pressed("Right"):
		velocity.x += accel
	
	if position.x < margin:
		velocity.x = 0
		position.x = margin
	if position.x > View.x - margin:
		velocity.x = 0
		position.x = View.x - margin
	if position.y > View.y - margin:
		velocity.y = 0
		position.y = View.y - margin
	if position.y < margin:
		velocity.y = 0
		position.y = margin
	
	var collision = move_and_collide(velocity)
