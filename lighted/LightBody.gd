class_name LightBody

extends CharacterBody2D

@export var lights = []
@export var colors = []

func _ready():
	reset()

func update_light():
	pass
	
func hit_by_light(body, color):
	pass
	
func reset():
	lights = []
	colors = []

func update_all():
	for i in Global.LIGHT_BODIES:
		i.reset()
	for i in Global.LIGHT_BODIES:
		if i is Emitter:
			i.update_light()

func check_ray(body, color, ray, outs):
	for oray in outs:
		var odir = (oray.to_global(oray.target_position) - oray.global_position).normalized()
		var ostart = oray.global_position
		if ray.is_colliding() and ray.get_collider() == body:
			lights[1] = []
			colors[1][0] = color
			lights[1].append(ostart + odir*Global.TILE_SIZE/2)
			if oray.is_colliding():
				lights[1].append(oray.get_collision_point())
				oray.get_collider().hit_by_light(self, color)
			else:
				lights[1].append(ostart + odir*Global.TILE_SIZE*25)

func _physics_process(delta):
	velocity *= 0.25
	if velocity.length() >= 0.05:
		update_all()
	move_and_slide()
