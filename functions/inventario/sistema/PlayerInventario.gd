class_name PlayerInventario;
extends Control;

#Sinais
signal ItemEquipado(Itm: Item);


#Propriedades
var Navegação: Equipavel;
var Mochila: Inventario;
var Flutuou: Sprite2D;

#Recursos
func _init() -> void:
	scale = Vector2(1.5, 1.5);
	var Player_Area: GridContainer = GridContainer.new();
	Player_Area.name = "You_End";
	Player_Area.set_anchors_preset(Control.PRESET_TOP_LEFT);
	add_child(Player_Area);
	criar_area_de_atalho();
	var Item_Area: GridContainer = GridContainer.new();
	Item_Area.name = "Bag_End";
	Item_Area.set_anchors_preset(Control.PRESET_TOP_RIGHT);
	add_child(Item_Area);

func criar_area_de_atalho() -> void:
	var inv2: Equipavel = Equipavel.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"), 32, Vector2(8, 1), true);
	inv2.name = "Inventario_Navegação";
	get_child(0).add_child(inv2);
	var bag: Inventario = Inventario.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"), 32, Vector2(9, 9));
	bag.name = "Inventario_Mochila";
	get_child(0).add_child(bag);
	inv2.connect("ItemFlutuantou", itemFlutuantou);
	inv2.connect("ItemEquipado", equipou);
	bag.connect("ItemFlutuantou", itemFlutuantou);
	Navegação = inv2;
	Mochila = bag;
	Mochila.hide();


func adicionar_inventario(Inv: GridContainer) -> void:
	if (Inv is InventarioBau or Inv is Inventario or Inv is Equipavel):
		Inv.connect("ItemFlutuantou", itemFlutuantou);
		get_child(1).add_child(Inv);


func remover_inventario() -> void:
	get_child(1).get_child(0).queue_free();


func adicionarMochila(Itm: ItemDropado) -> void:
	var res : Array = Mochila.temEspaco(Itm.ITEM);
	if (res[0] == true):
		Mochila.get_child(res[1]).adicionar_item(Itm.ITEM);
		Itm.queue_free();


#Funções
func itemFlutuantou(Itm: Item) -> void:
	Navegação.ITEM = Itm;
	Mochila.ITEM = Itm;
	for x in range(get_child(1).get_child_count()):
		var node = get_child(1).get_child(x);
		if (node is Inventario or node is InventarioBau or node is Equipavel):
			node.ITEM = Itm;
	
	if (Itm != null):
		var Flt: Sprite2D = Sprite2D.new();
		Flutuou = Flt;
		Flutuou.texture = Itm.TEXTURA;
		add_child(Flutuou);
	elif (Itm == null and Flutuou != null):
		Flutuou.queue_free();


func _process(delta) -> void:
	if (Input.is_action_just_pressed("key_inventario")):
		if (Mochila.visible == false):
			Mochila.show();
		elif (Mochila.visible == true):
			Mochila.hide();
		Navegação.mudar();
	
	if (Flutuou != null):
		Flutuou.position = get_local_mouse_position();


func equipou(Itm: Item) -> void:
	ItemEquipado.emit(Itm);
