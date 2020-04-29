extends RigidBody2D


export var score = 100
export var damage = 25
export var speed = 2

export var move_probability = 0.10

var ready = false
onready var Player = get_node("/root/Game/Ship")
var new_position = Vector2(0,0)



func die():
	get_parent().queue_free()

func _ready():
	randomize()
	var VP = get_viewport_rect().size
	position.x = randi() % int(VP.x)
	position.y = -10



func _physics_process(delta):
	if ready:
		$Tween.start()
		ready = false
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.name == "Ship":
			Player.change_health(-damage)
			get_parent().queue_free()

	if position.y > get_viewport_rect().size.y + 10:
		queue_free()

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(0,speed))
	state.set_angular_velocity(0)



