extends KinematicBody2D

var speed = 200

var destination = null
var target = Vector2()
var moving = false

onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.connect("animation_finished", self, "_on_animation_finished")
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_action_pressed("click"):
		moving = true
		target = get_global_mouse_position()
		
func _physics_process(delta):
	# moving horizontally, player position.x must be at 0
	destination = Vector2(target.x, global_position.y)
	if position.x != destination.x:
		position = position.move_toward(destination, delta * speed)
	else:
		moving = false
	
	# flipping the character.
	if target.x < position.x:
		scale.x = scale.y * -1
	elif target.x > position.x:
		scale.x = scale.y * 1
		
	play_animation()
		
func play_animation():
	if moving:
		animation_player.play("walk")
	else:
		animation_player.play("RESET") # I know what you're thinking, I could
		# just use the .stop(true) but somehow the animation does not reset.
		
