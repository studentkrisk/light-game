class_name Prisim

extends "LightBody.gd"

@onready var ray0: RayCast2D = $RayCast2D0
@onready var ray1: RayCast2D = $RayCast2D1
@onready var ray2: RayCast2D = $RayCast2D2
@onready var ray3: RayCast2D = $RayCast2D3

func reset():
	lights = [[], [], [], []]
	var z = Color(0, 0, 0, 0)
	colors = [[z, z, z], [z, z, z], [z, z, z], [z, z, z]]

func split(color: Color):
	return [Color(color.r, 0, 0, color.a/3), Color(0, color.g, 0, color.a/3), Color(0, 0, color.b, color.a/3)]

func hit_by_light(body, color):
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	ray2.force_raycast_update()
	ray3.force_raycast_update()
	var dir0 = (ray0.to_global(ray0.target_position) - ray0.global_position).normalized()
	var start0 = ray0.global_position
	var dir1 = (ray1.to_global(ray1.target_position) - ray1.global_position).normalized()
	var start1 = ray1.global_position
	var dir2 = (ray2.to_global(ray2.target_position) - ray2.global_position).normalized()
	var start2 = ray2.global_position
	var dir3 = (ray3.to_global(ray3.target_position) - ray3.global_position).normalized()
	var start3 = ray3.global_position
	
	var split_colors = split(color)
	
	if ray0.is_colliding() and ray0.get_collider() == body:
		lights[1] = []
		lights[2] = []
		lights[3] = []
		colors[1][0] = split_colors[0]
		colors[2][0] = split_colors[1]
		colors[3][0] = split_colors[2]
		lights[1].append(start1 + dir1*Global.TILE_SIZE/2)
		lights[2].append(start2 + dir2*Global.TILE_SIZE/2)
		lights[3].append(start3 + dir3*Global.TILE_SIZE/2)
		if ray1.is_colliding():
			lights[1].append(ray1.get_collision_point())
			ray1.get_collider().hit_by_light(self, colors[1].reduce(func(a, b): return a + b))
		else:
			lights[1].append(start1 + dir1*Global.TILE_SIZE*25)
		if ray2.is_colliding():
			lights[2].append(ray2.get_collision_point())
			ray2.get_collider().hit_by_light(self, colors[2].reduce(func(a, b): return a + b))
		else:
			lights[2].append(start2 + dir2*Global.TILE_SIZE*25)
		if ray3.is_colliding():
			lights[3].append(ray3.get_collision_point())
			ray3.get_collider().hit_by_light(self, colors[3].reduce(func(a, b): return a + b))
		else:
			lights[3].append(start3 + dir3*Global.TILE_SIZE*25)
	if ray1.is_colliding() and ray1.get_collider() == body:
		lights[2] = []
		lights[3] = []
		lights[0] = []
		colors[2][1] = split_colors[0]
		colors[3][1] = split_colors[1]
		colors[0][0] = split_colors[2]
		lights[2].append(start2 + dir2*Global.TILE_SIZE/2)
		lights[3].append(start3 + dir3*Global.TILE_SIZE/2)
		lights[0].append(start0 + dir0*Global.TILE_SIZE/2)
		if ray2.is_colliding():
			lights[2].append(ray2.get_collision_point())
			ray2.get_collider().hit_by_light(self, colors[2].reduce(func(a, b): return a + b))
		else:
			lights[2].append(start2 + dir2*Global.TILE_SIZE*25)
		if ray3.is_colliding():
			lights[3].append(ray3.get_collision_point())
			ray3.get_collider().hit_by_light(self, colors[3].reduce(func(a, b): return a + b))
		else:
			lights[3].append(start3 + dir3*Global.TILE_SIZE*25)
		if ray0.is_colliding():
			lights[0].append(ray0.get_collision_point())
			ray0.get_collider().hit_by_light(self, colors[0].reduce(func(a, b): return a + b))
		else:
			lights[0].append(start0 + dir0*Global.TILE_SIZE*25)
	if ray2.is_colliding() and ray2.get_collider() == body:
		lights[3] = []
		lights[0] = []
		lights[1] = []
		colors[3][2] = split_colors[0]
		colors[0][1] = split_colors[1]
		colors[1][1] = split_colors[2]
		lights[3].append(start3 + dir3*Global.TILE_SIZE/2)
		lights[0].append(start0 + dir0*Global.TILE_SIZE/2)
		lights[1].append(start1 + dir1*Global.TILE_SIZE/2)
		if ray3.is_colliding():
			lights[3].append(ray3.get_collision_point())
			ray3.get_collider().hit_by_light(self, colors[3].reduce(func(a, b): return a + b))
		else:
			lights[3].append(start3 + dir3*Global.TILE_SIZE*25)
		if ray0.is_colliding():
			lights[0].append(ray0.get_collision_point())
			ray0.get_collider().hit_by_light(self, colors[0].reduce(func(a, b): return a + b))
		else:
			lights[0].append(start0 + dir0*Global.TILE_SIZE*25)
		if ray1.is_colliding():
			lights[1].append(ray1.get_collision_point())
			ray1.get_collider().hit_by_light(self, colors[1].reduce(func(a, b): return a + b))
		else:
			lights[1].append(start1 + dir1*Global.TILE_SIZE*25)
	if ray3.is_colliding() and ray3.get_collider() == body:
		lights[0] = []
		lights[1] = []
		lights[2] = []
		colors[0][2] = split_colors[0]
		colors[1][2] = split_colors[1]
		colors[2][2] = split_colors[2]
		lights[0].append(start0 + dir0*Global.TILE_SIZE/2)
		lights[1].append(start1 + dir1*Global.TILE_SIZE/2)
		lights[2].append(start2 + dir2*Global.TILE_SIZE/2)
		if ray0.is_colliding():
			lights[0].append(ray0.get_collision_point())
			ray0.get_collider().hit_by_light(self, colors[0].reduce(func(a, b): return a + b))
		else:
			lights[0].append(start0 + dir0*Global.TILE_SIZE*25)
		if ray1.is_colliding():
			lights[1].append(ray1.get_collision_point())
			ray1.get_collider().hit_by_light(self, colors[1].reduce(func(a, b): return a + b))
		else:
			lights[1].append(start1 + dir1*Global.TILE_SIZE*25)
		if ray2.is_colliding():
			lights[2].append(ray2.get_collision_point())
			ray2.get_collider().hit_by_light(self, colors[2].reduce(func(a, b): return a + b))
		else:
			lights[2].append(start2 + dir2*Global.TILE_SIZE*25)

func update_light():
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	ray2.force_raycast_update()
	ray3.force_raycast_update()
	if not ray0.is_colliding():
		lights[1] = []
		colors[1][0] = Color(0, 0, 0, 0)
		lights[2] = []
		colors[2][0] = Color(0, 0, 0, 0)
		lights[3] = []
		colors[3][0] = Color(0, 0, 0, 0)
	if not ray1.is_colliding():
		lights[2] = []
		colors[2][1] = Color(0, 0, 0, 0)
		lights[3] = []
		colors[3][1] = Color(0, 0, 0, 0)
		lights[0] = []
		colors[0][0] = Color(0, 0, 0, 0)
	if not ray2.is_colliding():
		lights[3] = []
		colors[3][2] = Color(0, 0, 0, 0)
		lights[0] = []
		colors[0][1] = Color(0, 0, 0, 0)
		lights[1] = []
		colors[1][1] = Color(0, 0, 0, 0)
	if not ray3.is_colliding():
		lights[0] = []
		colors[0][2] = Color(0, 0, 0, 0)
		lights[1] = []
		colors[1][2] = Color(0, 0, 0, 0)
		lights[2] = []
		colors[2][2] = Color(0, 0, 0, 0)
