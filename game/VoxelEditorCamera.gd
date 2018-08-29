extends Camera

# variables:
var old_mouse_pos = Vector2()
var old_rotation = Vector3()
var offset = Vector3(0, 2, 2)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_just_pressed("mouse_left"):
		old_mouse_pos = get_viewport().get_mouse_position()
		old_rotation = self.rotation
	if Input.is_action_pressed("mouse_left"):
		self.rotation.y = ( old_mouse_pos.x - get_viewport().get_mouse_position().x )/100 + old_rotation.y
		self.rotation.x = ( old_mouse_pos.y - get_viewport().get_mouse_position().y )/100 + old_rotation.x

		if self.rotation.x > PI/4:
			self.rotation.x = PI/4
		if self.rotation.x < -PI/4:
			self.rotation.x = -PI/4

		var rotation_basis = Basis()
		rotation_basis.x = offset
		self.translation = rotation_basis.rotated(Vector3(0, 1, 0), self.rotation.y).x
		self.translation.y = 0-sin(self.rotation.x*2)*2