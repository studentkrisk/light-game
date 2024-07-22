extends CharacterBody2D

@export var light = []

func update_light():
	light = []
	var ray: RayCast2D = $RayCast2D
	var dir = (ray.to_global(ray.target_position) - ray.global_position).normalized()
	var start = ray.global_position
	light.append(start + dir*Global.TILE_SIZE/2)
	if ray.is_colliding():
		light.append(ray.get_collision_point())
		ray.get_collider().update_light()
	else:
		light.append(start + dir*Global.TILE_SIZE*25)
