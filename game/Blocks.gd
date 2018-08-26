extends Spatial

# variables
var cashed_world = {}

func _ready():
	instance_blocks(0, 0)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func instance_blocks(x, y):
	if cashed_world[x][y]: