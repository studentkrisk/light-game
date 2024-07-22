extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	for i in $lights.get_children():
		print(i.lighted)
		for j in i.lighted:
			draw_rect(Rect2(j - Vector2.ONE*8, Vector2.ONE*16), Color.WHITE)
