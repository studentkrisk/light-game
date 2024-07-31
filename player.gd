class_name Player

extends CharacterBody2D

@onready var ray = $RayCast2D

func _physics_process(delta):
	ray.force_raycast_update()
	var inp = Input.get_vector("left", "right", "up", "down")
	velocity += inp*25
	velocity *= 0.7
	if inp.length() > 0.1:
		ray.target_position = inp*9
	if ray.is_colliding() and ray.get_collider() is LightBody:
		ray.get_collider().velocity += inp*100
		if Input.is_action_just_pressed("rotate_clockwise"):
			ray.get_collider().rotate(PI/2)
		if Input.is_action_just_pressed("rotate_anticlockwise"):
			ray.get_collider().rotate(-PI/2)
		ray.get_collider().update_all()
	move_and_slide()
