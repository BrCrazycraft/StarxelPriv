extends Camera2D;



func _ready():
	var node = Inventario.new(Vector2(6, 1));
	node.scale = Vector2(2, 2);
	node.name = "Base";
	$CanvasLayer.add_child(node);
