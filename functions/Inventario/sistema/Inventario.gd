class_name Inventario;
extends GridContainer;

var rows: int;
var QUANTIDADE: int;
var ITEM_FLUTUANTE: ItemBase;

func _init(Size: Vector2, Max: int) -> void:
	columns = Size.x;
	rows = Size.y;
	size = Vector2((columns * 64), (rows * 64));
	QUANTIDADE = Max;


#Funções
func _ready() -> void:
	var id: int = 0;
	for y in range(rows):
		for x in range(columns):
			var slot = Slot.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"), id, QUANTIDADE);
			add_child(slot);
			id += 1;
