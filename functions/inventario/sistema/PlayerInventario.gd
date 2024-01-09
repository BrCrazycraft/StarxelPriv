class_name PlayerInventario;
extends Control;

var Navegação: Inventario;
var Mochila: Inventario;
var Flutuou: Sprite2D;

#Recursos
func _init() -> void:
	size = Vector2(ProjectSettings.get_setting("display/window/size/viewport_height"), ProjectSettings.get_setting("display/window/size/viewport_width"));
	scale = Vector2(1.5, 1.5);
	var Player_Area: GridContainer = GridContainer.new();
	Player_Area.name = "You_End";
	Player_Area.set_anchors_preset(Control.PRESET_TOP_LEFT);
	add_child(Player_Area);
	criar_area_de_atalho();
	var Item_Area: GridContainer = GridContainer.new();
	Item_Area.name = "You_End";
	Item_Area.set_anchors_preset(Control.PRESET_TOP_RIGHT);
	add_child(Item_Area);

func criar_area_de_atalho() -> void:
	var inv: Inventario = Inventario.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"), 32, Vector2(8, 1));
	inv.name = "Inventario_Navegação";
	get_child(0).add_child(inv);
	var bag: Inventario = Inventario.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"), 32, Vector2(9, 9));
	bag.name = "Inventario_Mochila";
	get_child(0).add_child(bag);
	inv.connect("ItemFlutuantou", itemFlutuantou);
	bag.connect("ItemFlutuantou", itemFlutuantou);
	Navegação = inv;
	Mochila = bag;


func adicionar_inventario(Inv: GridContainer) -> void:
	if (Inv is InventarioBau):
		Inv.connect("ItemFlutuantou", itemFlutuantou);
		get_child(1).add_child(Inv);


func remover_inventario() -> void:
	get_child(1).get_child(0).queue_free();

#Funções
func itemFlutuantou(Itm: Item) -> void:
	Navegação.ITEM = Itm;
	Mochila.ITEM = Itm;
	for x in range(get_child(1).get_child_count()):
		var node = get_child(1).get_child(x);
		print(node is InventarioBau);
		if (node is Inventario or node is InventarioBau):
			node.ITEM = Itm;
	
	if (Itm != null):
		var Flt: Sprite2D = Sprite2D.new();
		Flutuou = Flt;
		Flutuou.texture = Itm.TEXTURA;
		add_child(Flutuou);
	elif (Itm == null):
		Flutuou.queue_free();


func _process(delta) -> void:
	if (Input.is_action_just_pressed("key_inventario")):
		if (Mochila.visible == false):
			Mochila.show();
		elif (Mochila.visible == true):
			Mochila.hide();
	
	if (Flutuou != null):
		Flutuou.position = get_local_mouse_position();
