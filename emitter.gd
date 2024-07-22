extends CharacterBody2D

@export var lighted = []:
	set(value):
		lighted = value
		get_tree().root.get_child(0).queue_redraw()

func _ready():
	update_light()

func update_light():
	var ray: RayCast2D = $RayCast2D
	var dir = (ray.to_global(ray.target_position) - global_position).normalized()
	print(dir)
	var start = ray.global_position
	lighted = []
	if ray.is_colliding():
		for i in ray.get_collision_point().distance_to(start)/16-1:
			lighted.append(start + (i+1)*dir*16)
	else:
		for i in 25:
			lighted.append(start + i*dir*16)

func _process(delta):
	update_light()
