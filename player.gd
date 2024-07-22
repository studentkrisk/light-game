extends CharacterBody2D

@onready var ray = $RayCast2D

func _physics_process(delta):
	ray.force_raycast_update()
	var inp = Input.get_vector("left", "right", "up", "down")
	velocity += inp*25
	velocity *= 0.7
	ray.target_position = inp*9
	if ray.is_colliding() and ray.get_collider() is LightBody:
		ray.get_collider().velocity += inp*25
	move_and_slide()
