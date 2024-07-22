extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	update_light()
	
func update_light():
	for i in $emitters.get_children():
		var ray : RayCast2D = i.get_node("RayCast2D")
		for j in 256/16+1: # change eventually
			ray.target_position += ray.target_position.normalized()*16


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
