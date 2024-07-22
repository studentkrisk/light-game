class_name Splitter

extends CharacterBody2D

@export var lights = [[], []]

func split(color: Color):
	return [color/2, color/2]

func update_light(body, color):
	var inray: RayCast2D = $InRayCast2D
	var ray1: RayCast2D = $OutRayCast2D1
	var dir1 = (ray1.to_global(ray1.target_position) - ray1.global_position).normalized()
	var start1 = ray1.global_position
	var ray2: RayCast2D = $OutRayCast2D2
	var dir2 = (ray2.to_global(ray2.target_position) - ray2.global_position).normalized()
	var start2 = ray2.global_position
	if inray.is_colliding() and inray.get_collider() == body:
		var split_colors = split(color)
		lights[0] = [split_colors[0]]
		lights[1] = [split_colors[1]]
		lights[0].append(start1 + dir1*Global.TILE_SIZE/2)
		lights[1].append(start2 + dir2*Global.TILE_SIZE/2)
		if ray1.is_colliding():
			lights[0].append(ray1.get_collision_point())
			if not (ray1.get_collider() is Emitter):
				ray1.get_collider().update_light(self, color)
		else:
			lights[0].append(start1 + dir1*Global.TILE_SIZE*25)
		if ray2.is_colliding():
			lights[1].append(ray2.get_collision_point())
			if not (ray2.get_collider() is Emitter):
				ray2.get_collider().update_light(self, color)
		else:
			lights[1].append(start2 + dir2*Global.TILE_SIZE*25)
