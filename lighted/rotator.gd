class_name Rotator

extends "LightBody.gd"

@onready var ray0: RayCast2D = $RayCast2D0
@onready var ray1: RayCast2D = $RayCast2D1
	
func reset():
	lights = [[], []]
	colors = [[Color(0, 0, 0, 0)], [Color(0, 0, 0, 0)]]

func hit_by_light(body, color):
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	color = Color.from_hsv(fmod(color.h + 1.0/3.0, 1), color.s, color.v, color.a)
	call("generate_light", body, color, ray0, ray1, 1, 0)
	call("generate_light", body, color, ray1, ray0, 0, 0)

func update_light():
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	if not ray0.is_colliding():
		lights[1] = []
	if not ray1.is_colliding():
		lights[0] = []
