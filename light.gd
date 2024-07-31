extends Node2D

func _ready():
	update_light()
	Global.LIGHT_BODIES = $TileMap.get_children()

func update_light():
	print($TileMap.get_children())
	for i in $TileMap.get_children().filter(func(x): return x is Emitter):
		i.update_light()
	queue_redraw()

func _process(delta):
	queue_redraw()

func _draw():
	for lighted in $TileMap.get_children():
		for j in len(lighted.lights):
			if len(lighted.lights[j]) != 0:
				draw_line(lighted.lights[j][0], lighted.lights[j][1], lighted.colors[j].reduce(func(a, b): return a + b), Global.TILE_SIZE)
