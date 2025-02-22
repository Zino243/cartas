extends Node2D

@export var speed: float = 200.0  # Velocidad del personaje
var module_animated


func _ready() -> void:
	module_animated = get_parent().get_node("module_animated")


func _process(delta):
	var parent = get_parent()  # Acceder al nodo padre
	if parent:
		var direction = Vector2.ZERO  # Dirección inicial

		if Input.is_action_pressed("D"):
			direction.x += 1
		if Input.is_action_pressed("A"):
			direction.x -= 1
		if Input.is_action_pressed("S"):
			direction.y += 1
		if Input.is_action_pressed("W"):
			direction.y -= 1

		direction = direction.normalized()  # Normalizar el vector de dirección
		
		
		if direction != Vector2.ZERO:
			parent.position += direction * speed * delta  # Mover al nodo padre
			module_animated.stop_animation()
			# aqui poner el de RUN
		else:
			module_animated.play_animation("Idle")
