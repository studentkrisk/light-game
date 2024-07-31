class_name Mirror

extends "LightBody.gd"

@onready var ray0: RayCast2D = $RayCast2D0
@onready var ray1: RayCast2D = $RayCast2D1
	
func reset():
	lights = [[], []]
	colors = [[Color(0, 0, 0, 0)], [Color(0, 0, 0, 0)]]

func hit_by_light(body, color):
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	call("generate_light", body, color, ray0, ray1, 1)
	call("generate_light", body, color, ray1, ray0, 0)

func update_light():
	ray0.force_raycast_update()
	ray1.force_raycast_update()
	if not ray0.is_colliding():
		lights[1] = []
	if not ray1.is_colliding():
		lights[0] = []
