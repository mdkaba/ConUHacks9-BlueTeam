extends Area2D

func _ready():
	connect("area_entered", _on_area_entered)

func _on_area_entered(area):
	print("Collided with:", area.name)
