extends KinematicBody2D

onready var weapon_point = $WeaponPoint

var is_pressed = false
var touch_position = Vector2.ZERO
var touch_delta = Vector2.ZERO
var drag_delta = Vector2.ZERO

func _input(event):
	if is_pressed:
		if event is InputEventScreenTouch and event.is_pressed():
			touch_position = event.position
			touch_delta.x = touch_position.x - position.x
			touch_delta.y = touch_position.y - position.y
			
		if event is InputEventScreenDrag:
			touch_position = event.position
			drag_delta.x = touch_position.x - touch_delta.x
			drag_delta.y = touch_position.y - touch_delta.y
			position = drag_delta

func _on_TouchScreenButton_pressed():
	is_pressed = true
	weapon_point.activate()

func _on_TouchScreenButton_released():
	is_pressed = false
	weapon_point.deactivate()
