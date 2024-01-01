class_name Inventario;
extends GridContainer;

#Sinais
signal itemflutar(Item: ItemBase);

#Propriedades
var rows: int;
var QUANTIDADE: int;
var ITEM_FLUTUANTE: ItemBase;

func _init(Size: Vector2, Max: int) -> void:
	columns = Size.x;
	rows = Size.y;
	size = Vector2((columns * 64), (rows * 64));
	QUANTIDADE = Max;


func adicionar_item(Item: ItemBase, Id: int) -> void:
	var node = get_child(Id);
	if (node != null and node is Slot):
		node.adicionar_vazio(Item);


#Funções
func _ready() -> void:
	var id: int = 0;
	for y in range(rows):
		for x in range(columns):
			var slot = Slot.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"), id, QUANTIDADE);
			add_child(slot);
			slot.connect("clicou", clicou);
			id += 1;


func clicou(item: ItemBase, id: int) -> void:
	ITEM_FLUTUANTE = item;
	itemflutar.emit(item);
