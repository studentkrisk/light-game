extends Node2D

func _ready():
	await get_tree().create_timer(0).timeout # ??? for some reason i need this for it to work
	update_light()

func update_light():
	for i in $lights.get_children().filter(func(x): return x is Emitter):
		i.update_light()
	queue_redraw()

func _draw():
	for i in $lights.get_children():
		for j in i.lights:
			if len(j) != 0:
				draw_multiline(PackedVector2Array(j.slice(1)), j[0], Global.TILE_SIZE)
