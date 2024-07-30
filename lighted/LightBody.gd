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
	for i in Global.LIGHT_BODIES:
		if i is Reciver:
			i.evaluate()

func _physics_process(delta):
	velocity *= 0.25
	if velocity.length() >= 0.05:
		update_all()
	move_and_slide()
