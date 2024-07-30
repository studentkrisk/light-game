class_name LightBody

extends CharacterBody2D

@export var lights = []
@export var colors = []

func update_light():
	pass
	
func hit_by_light(body, color):
	pass

func _physics_process(delta):
	velocity *= 0.25
	if velocity.length() >= 0.05:
		for i in Global.LIGHT_BODIES:
			i.update_light()
	move_and_slide()
