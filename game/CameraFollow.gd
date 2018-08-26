extends Camera

# class member variables go here, for example:
const nodeToFollow = "/root/World/MainPlayer"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var player = get_node(nodeToFollow)
	var player_pos = player.translation
	var player_rot = player.rotation
	var basis = Basis()
	basis.x = Vector3(0, 4, -3)
	basis = basis.rotated(Vector3(0, 1, 0), player_rot.y)
	basis = basis.rotated(Vector3(0, 0, 1), player_rot.z)
	var goal_pos = player_pos + basis.x
	#self.translation = goal_pos
	self.rotation.y = player_rot.y
	rotate_y(PI)
	var translation_spd = goal_pos - self.translation
	self.translation = self.translation + translation_spd*goal_pos.distance_to(self.translation)*3*delta