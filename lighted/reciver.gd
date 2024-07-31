class_name Reciver

extends "LightBody.gd"

@onready var ray: RayCast2D = $RayCast2D
@export var color: Color = Color(1, 0, 0, 0.25)
@export var activated = false
var hit_by = null

signal hit(color)
signal unhit

func hit_by_light(body, c):
	if ray.is_colliding() and ray.get_collider() == body:
		hit_by = c
		if hit_by == color:
			activated = true
		else:
			activated = false
