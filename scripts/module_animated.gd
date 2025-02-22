extends Node2D

@export var animated_sprite: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite = get_parent().get_node("animate")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func play_animation(anim_name: String):
	if animated_sprite:
		animated_sprite.play(anim_name)

func stop_animation():
	if animated_sprite:
		animated_sprite.stop()
