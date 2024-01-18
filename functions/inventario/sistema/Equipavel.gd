class_name Equipavel;
extends GridContainer;

#Signal
signal ItemFlutuantou(item: Item);
signal ItemEquipado(item: Item);

#Propriedades
@export var TEXTURA: CompressedTexture2D;
@export var QUANTIDADE_MAXIMA : int;
@export var ITEM: Item;
var Close: bool = true;
var Modo: bool;

#Recursos
func _init(Textura: CompressedTexture2D, Max: int, Tamanho: Vector2, Mode: bool) -> void:
	TEXTURA = Textura;
	QUANTIDADE_MAXIMA = Max;
	Modo = Mode;
	size = Vector2(Tamanho.x * 40, Tamanho.y * 40);
	columns = Tamanho.x;

	var Id: int = 0;
	for x in Tamanho.x:
		for y in Tamanho.y:
			var slot: Slot = Slot.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"), Id, QUANTIDADE_MAXIMA);
			Id += 1;
			add_child(slot);
			slot.connect("clicou", clicou);
			slot.connect("selecionou", selecionou);
	get_child(1).adicionar_item(preload("res://functions/inventario/Armas/Espada.tres"));

func atualizar_maximo(Quantidade: int) -> void:
	QUANTIDADE_MAXIMA = Quantidade;
	for x in get_child_count():
		get_child(x).QUANTIDADE_MAXIMA = QUANTIDADE_MAXIMA;


#Funções
func clicou(Itm: Item, Id: int) -> void:
	var this: Slot = get_child(Id);
	if (ITEM != null and this.adicionavel(ITEM) and Close == false):
		this.adicionar_item(ITEM);
		if (valido(Itm)):
			ItemEquipado.emit(ITEM);
		ITEM = null;
		ItemFlutuantou.emit(ITEM);
	elif (ITEM == null and this.eVazio() == false and Close == false):
		ITEM = this.remover_item();
		ItemFlutuantou.emit(ITEM);
		ItemEquipado.emit(null);
	elif (Close == true):
		ItemEquipado.emit(Itm);


func selecionou(Itm: Item) -> void:
	if (Itm != null):
		ItemEquipado.emit(Itm, null);

func mudar() -> void:
	Close = !Close;


func valido(Itm: Item) -> bool:
	if (Modo == true):
		return true;
	else:
		if (Itm is ItemAcessorio or Itm is ItemArmadura):
			return true;
	return false;


func _input(event) -> void:
	if (event is InputEventKey and event.is_pressed()):
		match event.as_text():
			"1": get_child(0).selecionar();
			"2": get_child(1).selecionar();
			"3": get_child(2).selecionar();
			"4": get_child(3).selecionar();
			"5": get_child(4).selecionar();
			"6": get_child(5).selecionar();
			"7": get_child(6).selecionar();
			"8": get_child(7).selecionar();
