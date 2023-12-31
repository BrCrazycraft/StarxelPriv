class_name Inventario;
extends GridContainer;


var rows: int;



func _init(Size: Vector2) -> void:
	columns = Size.x;
	rows = Size.y;
	size = Vector2((columns * 64), (rows * 64));



func _ready() -> void:
	for y in range(rows):
		for x in range(columns):
			var slot = Slot.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"));
			add_child(slot);
