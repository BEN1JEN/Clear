extends RayCast

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	var camera = get_node("../Camera")
	self.translation = camera.translation
	self.rotation = camera.rotation