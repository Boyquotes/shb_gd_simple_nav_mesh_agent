# CATATAN:
# bedakan antara node dengan path node. node adalah istilah asli Godot Engine,
# sedangkan path node adalah istilah saya untuk pathfinding

# extend dari KinematicBody
extends KinematicBody

# kecepatan NavMeshAgent
export var speed = 8.0

# jarak maksimum antara path node yang dituju dengan agent untuk memutuskan melanjutkan ke path node berikutnya
export var checkpoint_distance = 1.0

# panjang ray untuk "picking"
export var ray_length = 300

# begin: assign node ke variabel
onready var nav = get_node("/root/World/Navigation")
onready var cam = get_node("/root/World/Camera")
# end: assign node ke variabel

# kecepatan
var vel = Vector3()

# path nodes
var path_nodes = []

# index path node
var node_index = 0

# abaikan
func _ready():
	pass

# ketika input event terjadi
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		# jika input event adalah tombol mouse ditekan pada button index 1
		
		# dapatkan posisi world dari kursor
		var result = cam_to_world(event.position)
		
		# jika ada, maka lakukan pathfinding
		if not result.empty():
			request_path(result["position"])
	pass

# frame fisika. delta adalah selisih waktu.
func _physics_process(delta):
	# begin: lakukan follow path dari hasil pathfinding
	var from = next_node()
	if from != null:
		from.y = 0
		var to = global_transform.origin
		to.y = 0
		
		if (from - to).length() < checkpoint_distance:
			next_node_index()
		else:
			vel = (from - to).normalized() * speed
			vel = move_and_slide(vel, Vector3.UP)
			pass
			# end: lakukan follow path dari hasil pathfinding

# cari path nodes antara posisi sekarang dengan target		
func request_path(target_pos):
	var from = global_transform.origin
	from.y = 0
	var to = target_pos
	to.y = 0
	
	path_nodes = nav.get_simple_path(from, to)
	reset_node_index()
	pass

# reset indeks path node
func reset_node_index():
	node_index = 0
	pass

# indeks path node selanjutnya
func next_node_index():
	node_index = node_index + 1
	pass

# path node selanjutnya
func next_node():
	if node_index < path_nodes.size():
		return path_nodes[node_index]
	else:
		return null
	pass

# konversi koordinat layar ke world
func cam_to_world(pos):
	return get_world().direct_space_state.intersect_ray(cam.project_ray_origin(pos), cam.project_ray_origin(pos) + cam.project_ray_normal(pos) * ray_length)
