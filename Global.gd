extends Node

const TILE_SIZE = 16

@onready var LIGHT_BODIES = get_tree().root.get_child(1).get_node("lights").get_children()
