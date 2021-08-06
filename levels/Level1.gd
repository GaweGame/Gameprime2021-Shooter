extends Node2D

signal enemy_killed

var enemy_kills = 0

func _process(delta):
#	var rad = deg2rad(-90)
#	$Arena.translate(Vector2(cos(rad), sin(rad)) * 20 * delta)
	pass

func _on_Level1_enemy_killed():
	enemy_kills += 1
	$CanvasLayer/HBoxContainer/KillValue.text = String(enemy_kills)
