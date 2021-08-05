extends Area2D

var damage = 0
var direction = Vector2.ZERO

func init(init_direction, init_damage):
	damage = init_damage
	direction = init_direction

func _process(delta):
	translate(direction)

func _on_PrimeBullet_body_entered(body):
	body.hit(damage)
	queue_free()
