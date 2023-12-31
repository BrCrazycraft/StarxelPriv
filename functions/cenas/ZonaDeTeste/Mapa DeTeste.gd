extends Node2D

func _ready() -> void:
	var node = Inventario.new(Vector2(6, 1), 64);
	node.scale = Vector2(2, 2);
	$Control/CanvasLayer.add_child(node);
	node.get_child(0).adicionar_vazio(preload("res://functions/inventario/Blocos/Terra.tres"));
