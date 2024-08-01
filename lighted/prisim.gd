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

func hit_by_light(body, color):
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	ray2.force_raycast_update()
	ray3.force_raycast_update()
	
	var r = Color(color.r, 0, 0, color.a/3)
	var g = Color(0, color.g, 0, color.a/3)
	var b = Color(0, 0, color.b, color.a/3)
	call("generate_light", body, r, ray0, ray1, 1, 0)
	call("generate_light", body, g, ray0, ray2, 2, 0)
	call("generate_light", body, b, ray0, ray3, 3, 0)
	call("generate_light", body, r, ray1, ray2, 2, 1)
	call("generate_light", body, g, ray1, ray3, 3, 1)
	call("generate_light", body, b, ray1, ray0, 0, 0)
	call("generate_light", body, r, ray2, ray3, 3, 2)
	call("generate_light", body, g, ray2, ray0, 0, 1)
	call("generate_light", body, b, ray2, ray1, 1, 1)
	call("generate_light", body, r, ray3, ray0, 0, 2)
	call("generate_light", body, g, ray3, ray1, 1, 2)
	call("generate_light", body, b, ray3, ray2, 2, 2)

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
