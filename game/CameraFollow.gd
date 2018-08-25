extends Camera

# class member variables go here, for example:
const nodeToFollow = "/root/World/MainPlayer"
var velocity = Vector3(0, 0, 0)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var player = get_node(nodeToFollow)
	var player_pos = player.translation
	var player_rot = player.rotation
	var basis = Basis()
	print(basis.rotated(Vector3(0, 0, 1), PI/2))