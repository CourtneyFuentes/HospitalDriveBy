extends Node2D

onready var Nurses = load("res://Scenes/Nurse.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < probability:
		var n = Nurses.instance()
		add_child(n)
