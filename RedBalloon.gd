extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("float_red")


func pop():
	gravity_scale = 5
	$AnimatedSprite.play("pop_red")
	

func _on_YellowBalloon_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		pop()


func _on_AnimatedSprite_animation_finished():
	if ($AnimatedSprite.animation == "pop_red"):
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
