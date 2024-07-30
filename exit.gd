extends StaticBody2D

@export var color = Color(0, 0, 0, 0)

func open(c):
	if c.is_equal_approx(color):
		$CollisionShape2D.set_deferred("disabled", true)
func close():
	$CollisionShape2D.set_deferred("disabled", false)



func _on_area_2d_body_entered(body):
	if body is Player:
		Global.CURRENT_LEVEL += 1
		get_tree().change_scene_to_file("res://levels/level%d.tscn" % Global.CURRENT_LEVEL)
