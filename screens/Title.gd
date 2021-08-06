extends Node2D

onready var anchor = $Anchor

func _process(delta):
	anchor.position.y -= delta * 20


func _on_Button_pressed():
	ScreenManager.change_scene("res://levels/Level1.tscn")
