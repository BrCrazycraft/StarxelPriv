extends Control;

var ITEM: ItemBase = null;


func adicionar(Inv: Inventario) -> void:
	Inv.connect("itemflutar", itemflutar);
	$Inventarios.add_child(Inv);
	Inv.adicionar_item(preload("res://functions/inventario/Blocos/Terra.tres"), 1);


func itemflutar(Item: ItemBase) -> void:
	for x in get_child(0).get_child_count():
		if (get_child(0).get_child(x) is Inventario):
			get_child(0).get_child(x).ITEM_FLUTUANTE = ITEM;
			add_child(ItemFlutuante.new(Item.TEXTURA));
