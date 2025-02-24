extends Node2D

@export var speed: float = 300.0  # Velocidad del seguimiento

func _process(delta):
	var parent = get_parent()  # Obtener el nodo padre
	if parent:
		var target_pos = get_global_mouse_position()
		parent.position = position.lerp(target_pos, 1 - exp(-speed * delta))  # Movimiento suave
