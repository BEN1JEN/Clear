extends Spatial

# variables:
var cashed_world = {0: {0: {0: {"opacity": 1}}}}

func _ready():
	instance_blocks(0, 0)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func check_for_visual_block(x, y, z):
	if not cashed_world.has(x):
		return false
	if not cashed_world[x].has(y):
		return false
	if not cashed_world[x][y].has(z):
		return false
	if cashed_world[x][y][z]:
		if cashed_world[x][y][z]["opacity"] == 1:
			return true
	return false
func instance_blocks(x, y):
	var blockscene = load("res://Block.tscn")
	if not cashed_world.has(x):
		return false
	if not cashed_world[x].has(y):
		return false
	if cashed_world[x][y]:
		for z in cashed_world[x][y]:
			if check_for_visual_block(x, y, z):
				if not ( check_for_visual_block(x+1, y, z) or
				check_for_visual_block(x-1, y, z) or
				check_for_visual_block(x, y+1, z) or
				check_for_visual_block(x, y-1, z) or
				check_for_visual_block(x, y, z+1) or
				check_for_visual_block(x, y, z-1) ):
					print("instance")
					var block = blockscene.instance()
					block.translation = Vector3(x, y, z)
					self.call_deferred("add_child", block)