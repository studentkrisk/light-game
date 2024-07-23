class_name Emitter

extends "LightBody.gd"

@export var color = Color(1, 1, 1, 0.5)
@onready var ray: RayCast2D = $RayCast2D

func update_light():
	ray.force_raycast_update()
	lights = [[]]
	colors = [color]
	var dir = (ray.to_global(ray.target_position) - ray.global_position).normalized()
	var start = ray.global_position
	lights[0].append(start + dir*Global.TILE_SIZE/2)
	if ray.is_colliding():
		lights[0].append(ray.get_collision_point())
		if not (ray.get_collider() is Emitter):
			ray.get_collider().update_light()
	else:
		lights[0].append(start + dir*Global.TILE_SIZE*25)
