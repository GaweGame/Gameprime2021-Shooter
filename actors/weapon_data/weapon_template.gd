class_name WeaponTemplate
extends Resource

export var delay = 15
export(int, -180, 180, 5) var angle = -90
export var bullet_count = 1
export(int, 0, 15, 1) var bullet_spread_angle = 0
export var bullet_speed = 500
export var bullet_damage = 10

var bullet_asset = preload("res://actors/Prime-Bullet.tscn")

var current_time = 0

func update(delta):
	current_time += delta
	if current_time >= (delay * delta):
		current_time = 0
		
		var half_angle = bullet_spread_angle * 0.5
		var calc_count = bullet_count - 1
		var adjusted_angle = angle - (half_angle * calc_count)
		var bullets = []
		for i in bullet_count:
			var step = (i + 1)
			var margin = (bullet_spread_angle * i) + adjusted_angle
			bullets.append(createBullet(delta, margin))
		return bullets

func createBullet(_delta, _angle):
	var new_bullet = bullet_asset.instance()
			
	var rad = deg2rad(_angle)
	var v = Vector2(cos(rad), sin(rad))
	var direction = v * bullet_speed * _delta
	
	new_bullet.init(direction, bullet_damage)
	
	return new_bullet
