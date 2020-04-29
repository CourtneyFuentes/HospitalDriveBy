extends RigidBody2D

var velocity = Vector2(0,0)
export var min_speed = 100

export var score = 500




func _ready():
	randomize()

	linear_velocity = velocity

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.name == "Ship":
			c.change_score(score)
			queue_free()

		queue_free()

func _integrate_forces(state):
	#state.set_linear_velocity(velocity)
	pass
