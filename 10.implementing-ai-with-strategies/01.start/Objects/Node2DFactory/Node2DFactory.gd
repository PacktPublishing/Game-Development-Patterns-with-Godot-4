extends Marker2D
class_name Node2DFactory

signal created(product)

@export var product_packed_scene: PackedScene
@export var target_container_name: StringName


func create(_product_packed_scene := product_packed_scene) -> Node2D:
	var product: Node2D = _product_packed_scene.instantiate()
	product.global_position = global_position
	
	var container = find_parent("Level").find_child(target_container_name)
	container.call_deferred("add_child", product)
	
	created.emit(product)
	return product
