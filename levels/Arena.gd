extends Node2D

func _process(delta):
	transform.origin.y -= 50 * delta

func _on_HeroBulletArea_body_entered(body):
	body.queue_free()

func _on_EnemyBulletArea_body_entered(body):
	body.queue_free()

func loadEnemyPattern(pattern):
	add_child(pattern)
