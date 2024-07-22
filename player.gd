extends CharacterBody2D

func _physics_process(delta):
	velocity += Input.get_vector("left", "right", "up", "down")*25
	velocity *= 0.7
	move_and_slide()
