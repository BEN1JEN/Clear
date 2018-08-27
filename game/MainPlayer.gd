extends KinematicBody

# variables:
var velocity = Vector3(0, 0, 0)
var gravity = Vector3(0, -9.7, 0)
var rotation_velocity = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var rotation_basis = Basis()
	rotation_basis.x = Vector3(0, 0, 0)
	if Input.is_action_pressed("movement_forward"):
		rotation_basis.x.z = delta
	if Input.is_action_pressed("movement_backward"):
		rotation_basis.x.z = -delta
	if Input.is_action_pressed("movement_left"):
		rotation_velocity = rotation_velocity + delta / 2
	if Input.is_action_pressed("movement_right"):
		rotation_velocity = rotation_velocity - delta / 2

	rotation_velocity = rotation_velocity * (0.85)
	rotate_y(rotation_velocity)

	velocity = velocity + rotation_basis.rotated(Vector3(0, 1, 0), self.rotation.y).x
	velocity = velocity * (0.9)

	self.translation = self.translation + velocity

func _physics_process(delta):
	pass