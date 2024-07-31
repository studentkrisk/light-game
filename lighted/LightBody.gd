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

func check_rays(body, color, outs):
	var cur_color_inds = range(len(colors)).map(func(x): return 0)
	for i in range(len(outs)):
		var ray = outs[i]
		if ray.is_colliding() and ray.get_collider() == body:
			for o in range(len(outs)).filter(func(x): return x != i):
				var oray = outs[o]
				var odir = (oray.to_global(oray.target_position) - oray.global_position).normalized()
				var ostart = oray.global_position
				lights[o] = []
				colors[o][cur_color_inds[o]] = color
				print(color, " ", cur_color_inds)
				cur_color_inds[o] += 1
				lights[o].append(ostart + odir*Global.TILE_SIZE/2)
				if oray.is_colliding():
					lights[o].append(oray.get_collision_point())
					oray.get_collider().hit_by_light(self, colors[o].reduce(func(a, b): return a + b))
				else:
					lights[o].append(ostart + odir*Global.TILE_SIZE*25)

func _physics_process(delta):
	velocity *= 0.25
	if velocity.length() >= 0.05:
		update_all()
	move_and_slide()
