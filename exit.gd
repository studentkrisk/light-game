extends StaticBody2D

@export var recivers: Array[Reciver] = []

func _on_area_2d_body_entered(body):
	if body is Player:
		Global.CURRENT_LEVEL += 1
		get_tree().change_scene_to_file("res://levels/level%d.tscn" % Global.CURRENT_LEVEL)


func _on_area_2d_2_body_entered(body):
	$CollisionShape2D.set_deferred("disabled", body is Player and recivers.reduce(func(a, b): return a and b.activated, true))
