extends KinematicBody

export var speed = 8.0
export var checkpoint_distance = 1.0
export var ray_length = 300

onready var nav = get_node("/root/World/Navigation")
onready var cam = get_node("/root/World/Camera")

var vel = Vector3()
var path_nodes = []
var node_index = 0

func _ready():
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var result = cam_to_world(event.position)
		
		if not result.empty():
			request_path(result["position"])
	pass
	
func _physics_process(delta):
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
			
func request_path(target_pos):
	var from = global_transform.origin
	from.y = 0
	var to = target_pos
	to.y = 0
	
	path_nodes = nav.get_simple_path(from, to)
	reset_node_index()
	pass
	
func reset_node_index():
	node_index = 0
	pass
	
func next_node_index():
	node_index = node_index + 1
	pass
	
func next_node():
	if node_index < path_nodes.size():
		return path_nodes[node_index]
	else:
		return null
	pass
	
func cam_to_world(pos):
	return get_world().direct_space_state.intersect_ray(cam.project_ray_origin(pos), cam.project_ray_origin(pos) + cam.project_ray_normal(pos) * ray_length)
