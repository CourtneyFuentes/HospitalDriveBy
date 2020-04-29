extends Node2D



onready var Enemy1 = load("res://Scenes/Zombie.tscn")


func _ready():
	randomize()


func _on_Timer_timeout():
	if get_child_count() < max_enemies + 1:
				var e = Enemy1.instance()
				add_child(e)
