extends CharacterBody2D

@export var lighted = []:
	set(value):
		lighted = value
		get_tree().root.get_child(0).queue_redraw()

func _ready():
	update_light()

func update_light():
	var ray: RayCast2D = $RayCast2D
	lighted = []
	if ray.is_colliding():
		for i in ray.get_collision_point().distance_to(ray.global_position - ray.target_position.normalized()*-8)/16:
			lighted.append(ray.global_position + (i+1)*ray.target_position.normalized()*16)
	else:
		for i in 25:
			#lighted.append(ray.global_position + i*ray.target_position.normalized()*16)

func _process(delta):
	update_light()
