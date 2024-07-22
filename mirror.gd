class_name Mirror

extends "LightBody.gd"

@onready var ray1: RayCast2D = $RayCast2D1
@onready var ray2: RayCast2D = $RayCast2D2
	
func _ready():
	lights = [[], []]
	colors = [Color(0, 0, 0, 0), Color(0, 0, 0, 0)]

func update_light():
	ray1.force_raycast_update()
	ray2.force_raycast_update()
	var dir1 = (ray1.to_global(ray1.target_position) - ray1.global_position).normalized()
	var start1 = ray1.global_position
	var dir2 = (ray2.to_global(ray2.target_position) - ray2.global_position).normalized()
	var start2 = ray2.global_position
	if ray1.is_colliding() and ray1.get_collider() is LightBody:
		var body = ray1.get_collider()
		lights[1] = []
		colors[1] = body.color
		lights[1].append(start2 + dir2*Global.TILE_SIZE/2)
		if ray2.is_colliding():
			var collider = ray2.get_collider()
			lights[1].append(ray2.get_collision_point())
			if not (collider is Emitter) and collider is LightBody:
				ray2.get_collider().update_light()
		else:
			lights[1].append(start2 + dir2*Global.TILE_SIZE*25)
	else:
		lights[1] = []
	if ray2.is_colliding() and ray2.get_collider() is LightBody:
		var body = ray2.get_collider()
		lights[0] = []
		colors[0] = body.color
		lights[0].append(start1 + dir1*Global.TILE_SIZE/2)
		if ray1.is_colliding():
			var collider = ray1.get_collider()
			lights[0].append(ray1.get_collision_point())
			if not (collider is Emitter) and collider is LightBody:
				ray1.get_collider().update_light()
		else:
			lights[0].append(start1 + dir1*Global.TILE_SIZE*25)
	else:
		lights[0] = []
