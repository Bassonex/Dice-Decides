extends Control

func _on_item_list_item_clicked(index: int, at_pos: Vector2, btn: int) -> void:
	print(index)
	if btn != MOUSE_BUTTON_LEFT:
		return
	Ga.inc_attr_by_index(index, 1.0)
