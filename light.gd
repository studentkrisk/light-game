extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	update_light()
	
var lighted = []
func update_light():
	lighted = []
	for i in $emitters.get_children():
		var cur = i.get_node("RayCast2D").global_position
		var dir = i.get_node("RayCast2D").target_position.normalized()
		for j in 256/16+1: # change eventually
			cur += dir*16
			lighted.append(cur)
	queue_redraw()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	for i in lighted:
		draw_rect(Rect2(i - Vector2.ONE*8, Vector2.ONE*16), Color.WHITE)
