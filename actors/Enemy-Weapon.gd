extends Position2D

export(Resource) var weapon_data
var _active = false

func activate():
	weapon_data.current_time = 0
	_active = true

func deactivate():
	_active = false

func _process(delta):
	if _active:
		var bullets = weapon_data.update(delta)
		if bullets:
			spawn_bullets(bullets)

func spawn_bullets(bullets):
	for bullet in bullets:
		var arena = get_node("../../../../../")
		var enemy = get_parent()
		bullet.position = enemy.position + position
		arena.add_child(bullet)
