class_name Splitter

extends "LightBody.gd"

@onready var ray1: RayCast2D = $RayCast2D1
@onready var ray2: RayCast2D = $RayCast2D2
@onready var ray3: RayCast2D = $RayCast2D3

func _ready():
	lights = [[], [], []]
	colors = [Color(0, 0, 0, 0), Color(0, 0, 0, 0), Color(0, 0, 0, 0)]

func split(color: Color):
	return [Color(color, color.a/2), Color(color, color.a/2)]

func update_light():
	ray1.force_raycast_update()
	ray2.force_raycast_update()
	ray3.force_raycast_update()
	
	var dir1 = (ray1.to_global(ray1.target_position) - ray1.global_position).normalized()
	var start1 = ray1.global_position
	var dir2 = (ray2.to_global(ray2.target_position) - ray2.global_position).normalized()
	var start2 = ray2.global_position
	var dir3 = (ray3.to_global(ray3.target_position) - ray3.global_position).normalized()
	var start3 = ray3.global_position
	
	if ray1.is_colliding() and ray1.get_collider() == body:
		lights[1] = []
		lights[2] = []
		colors[1] += split_colors[0]
		colors[2] += split_colors[1]
		lights[1].append(start2 + dir2*Global.TILE_SIZE/2)
		lights[2].append(start3 + dir3*Global.TILE_SIZE/2)
		if ray2.is_colliding():
			var collider = ray2.get_collider()
			lights[1].append(ray2.get_collision_point())
			if not (collider is Emitter) and collider is LightBody:
				ray2.get_collider().update_light(self, split_colors[0])
		else:
			lights[1].append(start2 + dir2*Global.TILE_SIZE*25)
		if ray3.is_colliding():
			var collider = ray3.get_collider()
			lights[2].append(ray3.get_collision_point())
			if not (ray3.get_collider() is Emitter) and collider is LightBody:
				ray3.get_collider().update_light(self, split_colors[1])
		else:
			lights[2].append(start3 + dir3*Global.TILE_SIZE*25)
	
	if ray2.is_colliding() and ray2.get_collider() == body:
		lights[2] = []
		lights[0] = []
		colors[2] += split_colors[0]
		colors[0] += split_colors[1]
		lights[2].append(start3 + dir3*Global.TILE_SIZE/2)
		lights[0].append(start1 + dir1*Global.TILE_SIZE/2)
		if ray3.is_colliding():
			var collider = ray3.get_collider()
			lights[2].append(ray3.get_collision_point())
			if not (ray3.get_collider() is Emitter) and collider is LightBody:
				ray3.get_collider().update_light(self, split_colors[0])
		else:
			lights[2].append(start3 + dir3*Global.TILE_SIZE*25)
		if ray1.is_colliding():
			var collider = ray1.get_collider()
			lights[0].append(ray1.get_collision_point())
			if not (ray1.get_collider() is Emitter) and collider is LightBody:
				ray1.get_collider().update_light(self, split_colors[1])
		else:
			lights[0].append(start1 + dir1*Global.TILE_SIZE*25)
			
	if ray3.is_colliding() and ray3.get_collider() == body:
		lights[0] = []
		lights[1] = []
		colors[0] += split_colors[0]
		colors[1] += split_colors[1]
		lights[0].append(start1 + dir1*Global.TILE_SIZE/2)
		lights[1].append(start2 + dir2*Global.TILE_SIZE/2)
		if ray1.is_colliding():
			var collider = ray1.get_collider()
			lights[0].append(ray1.get_collision_point())
			if not (ray1.get_collider() is Emitter) and collider is LightBody:
				ray1.get_collider().update_light(self, split_colors[0])
		else:
			lights[0].append(start1 + dir1*Global.TILE_SIZE*25)
		if ray2.is_colliding():
			var collider = ray2.get_collider()
			lights[1].append(ray2.get_collision_point())
			if not (ray2.get_collider() is Emitter) and collider is LightBody:
				ray2.get_collider().update_light(self, split_colors[1])
		else:
			lights[1].append(start2 + dir2*Global.TILE_SIZE*25)
