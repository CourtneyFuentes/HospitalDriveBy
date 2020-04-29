extends Node2D

onready var Doc = load("res://Scenes/Doctor.tscn")
export var probability = 0.5


func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < probability:
		var d = Doc.instance()
		add_child(d)
