extends Node2D

func _ready():
	await get_tree().create_timer(0).timeout # ??? for some reason i need this for it to work
	update_light()

func update_light():
	for i in $lights.get_children().filter(func(x): return x is Emitter):
		i.update_light()
	queue_redraw()

func _draw():
	for lighted in $lights.get_children():
		for j in len(lighted.lights):
			if len(lighted.lights[j]) != 0:
				draw_line(lighted.lights[j][0], lighted.lights[j][1], lighted.colors[j], Global.TILE_SIZE)
