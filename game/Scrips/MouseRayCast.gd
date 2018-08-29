extends RayCast

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	var space_state = get_world().direct_space_state
	var camera = get_node("../Camera")
	self.translation = camera.translation


	var res = get_node("/root").size
	var fov = camera.fov/360*PI
	var aspect = res.x/res.y
	var mousePos = get_viewport().get_mouse_position()/(res/2)
	mousePos.x = mousePos.x - 1
	mousePos.y = mousePos.y - 1

	var mouseRot = Vector2(mousePos.x*fov*aspect, mousePos.y*fov)

	self.rotation = camera.rotation

	self.rotate_x(-mouseRot.y)
	self.rotate_y(-mouseRot.x)