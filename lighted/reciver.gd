class_name Reciver

extends "LightBody.gd"

@onready var ray: RayCast2D = $RayCast2D
signal hit(color)
signal unhit

var last_hit_by = null
var hit_by = null

func reset():
	hit_by = null

func hit_by_light(body, color):
	if ray.is_colliding() and ray.get_collider() == body:
		hit_by = color

func evaluate():
	if last_hit_by != hit_by:
		if hit_by != null:
			hit.emit(hit_by)
			print("hit by ", hit_by)
		else:
			unhit.emit()
			print(unhit)
	last_hit_by = hit_by
