extends KinematicBody2D

export(int) var health = 60
onready var anim = $AnimationPlayer
var explosion = preload("res://effects/Explosion.tscn")

func hit(damage):
	anim.play("hit")
	health -= damage
	if health <= 0:
		get_tree().get_root().get_child(0).emit_signal("enemy_killed")
		var exp_instance = explosion.instance()
		exp_instance.global_position = global_position
		get_tree().get_current_scene().add_child(exp_instance)
		queue_free()
