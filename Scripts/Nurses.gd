extends Node2D

onready var Nurses = load("res://Scenes/Nurse.tscn")
export var probability = 0.5

func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < probability:
		var n = Nurses.instance()
		add_child(n)
