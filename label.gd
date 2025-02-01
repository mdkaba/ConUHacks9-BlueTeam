extends Label



func _process(delta):
	var parent = get_parent()
	if parent and "health" in parent:
		text = str(parent.health)
