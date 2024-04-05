extends Control

var car_model_paths = [
	"res://assets/Low Poly Cars/60s_muscle_car_orange.glb",
	"res://assets/Low Poly Cars/muscle_60s_red.glb", 
	"res://assets/Low Poly Cars/muscle_car_classic_blue_low_poly.glb"
]
var car_names = ["Car 1", "Car 2", "Car 3"]

@onready var vehicle_nodes = [get_node("../VehicleBody3D"),
					 get_node("../../VehicleBody3D2"),
					 get_node("../../VehicleBody3D3")]

var current_car_index = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$"../HBoxContainer/LeftButton".connect("pressed", _on_LeftArrow_pressed)
	$"../HBoxContainer/RightButton".connect("pressed", _on_RightArrow_pressed)
	
	# Update the UI with the first car
	load_car_model(car_model_paths[current_car_index])
	update_car_preview()
	

func load_car_model(model_path):
	var model_scene = load(model_path).instance()
	vehicle_nodes[current_car_index].add_child(model_scene)

func update_car_preview():
	$Label.text = car_names[current_car_index]

	for i in range(vehicle_nodes.size()):
		if i == current_car_index:
			vehicle_nodes[i].show()
		else:
			vehicle_nodes[i].hide()


func _on_LeftArrow_pressed():
	current_car_index = (current_car_index - 1 + car_model_paths.size()) % car_model_paths.size()
	load_car_model(car_model_paths[current_car_index])
	update_car_preview()

func _on_RightArrow_pressed():
	current_car_index = (current_car_index + 1) % car_model_paths.size()
	load_car_model(car_model_paths[current_car_index])
	update_car_preview()

