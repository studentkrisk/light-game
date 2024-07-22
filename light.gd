extends Node2D

func _ready():
	await get_tree().root.is_node_ready()
	update_light()

func update_light():
	for i in $lights.get_children():
		i.update_light()
	get_tree().root.get_child(1).queue_redraw()

func _process(delta):
	update_light()

func _draw():
	for i in $lights.get_children():
		draw_multiline(PackedVector2Array(i.light), Color(1, 1, 1, 0.5), Global.TILE_SIZE)
