class_name Splitter

extends "LightBody.gd"

@onready var ray0: RayCast2D = $RayCast2D0
@onready var ray1: RayCast2D = $RayCast2D1
@onready var ray2: RayCast2D = $RayCast2D2

func reset():
	lights = [[], [], []]
	colors = [[Color(0, 0, 0, 0), Color(0, 0, 0, 0)], [Color(0, 0, 0, 0), Color(0, 0, 0, 0)], [Color(0, 0, 0, 0), Color(0, 0, 0, 0)]]


func hit_by_light(body, color):
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	ray2.force_raycast_update()
	var new_color = Color(color, color.a/2)
	call("generate_light", body, new_color, ray0, ray1, 1, 0)
	call("generate_light", body, new_color, ray0, ray2, 2, 0)
	call("generate_light", body, new_color, ray1, ray2, 2, 1)
	call("generate_light", body, new_color, ray1, ray0, 0, 0)
	call("generate_light", body, new_color, ray2, ray0, 0, 1)
	call("generate_light", body, new_color, ray2, ray1, 1, 1)
	

func update_light():
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	ray2.force_raycast_update()
	if not ray0.is_colliding():
		lights[1] = []
		colors[1][0] = Color(0, 0, 0, 0)
		lights[2] = []
		colors[2][0] = Color(0, 0, 0, 0)
	if not ray1.is_colliding():
		lights[2] = []
		colors[2][0] = Color(0, 0, 0, 0)
		lights[0] = []
		colors[0][1] = Color(0, 0, 0, 0)
	if not ray2.is_colliding():
		lights[0] = []
		colors[0][1] = Color(0, 0, 0, 0)
		lights[1] = []
		colors[1][1] = Color(0, 0, 0, 0)
