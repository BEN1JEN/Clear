extends Camera

# variables:
const nodeToFollow = "/root/World/MainPlayer"
const follow_angle = Vector3(0, 3, -3)
const player_angle_offset = PI

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var player = get_node(nodeToFollow)
	var player_pos = player.translation
	var player_rot = player.rotation
	var basis = Basis()
	basis.x = follow_angle
	basis = basis.rotated(Vector3(0, 1, 0), player_rot.y)
	basis = basis.rotated(Vector3(0, 0, 1), player_rot.z)
	var goal_pos = player_pos + basis.x
	#self.translation = goal_pos
	self.rotation.y = player_rot.y
	rotate_y(player_angle_offset)
	var translation_spd = goal_pos - self.translation
	self.translation = self.translation + translation_spd*goal_pos.distance_to(self.translation)*3*delta