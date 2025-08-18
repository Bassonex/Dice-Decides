extends Node
# this script is just big dictionary for all values that are used in game

@export var speed: float = 1.0
@export var jump_up_force: float = 3.0
@export var jump_forward_force: float = 1.0
@export var jump_cooldown: float = 5.0
@export var shrink_force: float = 1.0
@export var health: float = 3.0

# kinda dictionary
const attributes := [
	"speed",
	"jump_up_force",
	"jump_cooldown",
	"health"
]

func inc_attr_by_index(index: int, delta: float = 1.0) -> void:
	if index < 0 or index >= attributes.size():
		return
	var key : StringName = attributes[index]
	set(key, get(key) + delta)
	print("%s = %s" % [key, str(get(key))])
