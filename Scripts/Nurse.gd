extends RigidBody2D

var velocity = Vector2(0,0)
export var min_speed = 100

export var score = 250




func _ready():
	randomize()
	#queue_free()

func _integrate_forces(state):
	#state.set_linear_velocity(velocity)
	pass
