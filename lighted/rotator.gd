class_name Rotator

extends "LightBody.gd"

@onready var ray0: RayCast2D = $RayCast2D0
@onready var ray1: RayCast2D = $RayCast2D1
	
func reset():
	lights = [[], []]
	colors = [[Color(0, 0, 0, 0)], [Color(0, 0, 0, 0)]]

func hit_by_light(body, color):
	print(color)
	color = Color.from_hsv(fmod(color.h + 1.0/3.0, 1), color.s, color.v, color.a)
	print(color)
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	var dir0 = (ray0.to_global(ray0.target_position) - ray0.global_position).normalized()
	var start0 = ray0.global_position
	var dir1 = (ray1.to_global(ray1.target_position) - ray1.global_position).normalized()
	var start1 = ray1.global_position
	if ray0.is_colliding() and ray0.get_collider() == body:
		lights[1] = []
		colors[1][0] = color
		lights[1].append(start1 + dir1*Global.TILE_SIZE/2)
		if ray1.is_colliding():
			lights[1].append(ray1.get_collision_point())
			ray1.get_collider().hit_by_light(self, colors[1][0])
		else:
			lights[1].append(start1 + dir1*Global.TILE_SIZE*25)
	if ray1.is_colliding() and ray1.get_collider() == body:
		lights[0] = []
		colors[0][0] = color
		lights[0].append(start0 + dir0*Global.TILE_SIZE/2)
		if ray0.is_colliding():
			lights[0].append(ray0.get_collision_point())
			ray0.get_collider().hit_by_light(self, colors[0][0])
		else:
			lights[0].append(start0 + dir0*Global.TILE_SIZE*25)

func update_light():
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	if not ray0.is_colliding():
		lights[1] = []
	if not ray1.is_colliding():
		lights[0] = []
