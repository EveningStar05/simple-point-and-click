extends KinematicBody2D

var speed = 200

var destination = null
var target = Vector2()
var moving = false

onready var camera2d = $Camera2D
onready var animation_player = $AnimationPlayer
var item_interaction = null

func _ready():
	$PlayerRadar.connect("body_entered", self, "_on_body_entered")
	$PlayerRadar.connect("body_exited", self, "_on_body_exited")
	
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
		
#	===================================================
#	TODO:
#		add clamp: limit is on the edges of the tilemap
#	===================================================

	if target.x < position.x:
		scale.x = scale.y * -1
	elif target.x > position.x:
		scale.x = scale.y * 1
		
func _on_body_entered(body):
	item_interaction = body
	
func _on_body_exited(_body):
	item_interaction = null
