extends CharacterBody2D

@export var light = []

func update_light():
	light = []
	var ray1: RayCast2D = $RayCast2D1
	var dir1 = (ray1.to_global(ray1.target_position) - ray1.global_position).normalized()
	var start1 = ray1.global_position
	var ray2: RayCast2D = $RayCast2D2
	var dir2 = (ray2.to_global(ray2.target_position) - ray2.global_position).normalized()
	var start2 = ray2.global_position
	if $RayCast2D1.is_colliding():
		light.append(start2 + dir2*Global.TILE_SIZE/2)
		if ray2.is_colliding():
			light.append(ray2.get_collision_point())
			ray2.get_collider().update_light()
		else:
			light.append(start2 + dir2*Global.TILE_SIZE*25)
	if $RayCast2D2.is_colliding():
		light.append(start1 + dir1*Global.TILE_SIZE/2)
		if ray1.is_colliding():
			light.append(ray1.get_collision_point())
			ray1.get_collider().update_light()
		else:
			light.append(start1 + dir1*Global.TILE_SIZE*25)
