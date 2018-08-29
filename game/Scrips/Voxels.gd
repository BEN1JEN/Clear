extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var voxelscene = load("res://scenes/Voxel.tscn")
	for x in range(-10, 10):
		for y in range(-15, 15):
			for z in range(-10, 10):
				var voxel = voxelscene.instance()
				voxel.set_name("voxel_x" + str(x) + "_y" + str(y) + "_z" + str(z))
				voxel.translate(Vector3(x, y, z))
				call_deferred("add_child", voxel)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
