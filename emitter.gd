class_name Emitter

extends CharacterBody2D

@export var lights = [[]]
@export var color = Color(1, 1, 1, 0.5)
@export var colors = []

func update_light():
	lights = [[]]
	colors = [color]
	var ray: RayCast2D = $RayCast2D
	var dir = (ray.to_global(ray.target_position) - ray.global_position).normalized()
	var start = ray.global_position
	lights[0].append(start + dir*Global.TILE_SIZE/2)
	if ray.is_colliding():
		lights[0].append(ray.get_collision_point())
		if not (ray.get_collider() is Emitter):
			ray.get_collider().update_light(self, colors[0])
	else:
		lights[0].append(start + dir*Global.TILE_SIZE*25)
