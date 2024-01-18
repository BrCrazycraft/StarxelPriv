class_name Inventario;
extends GridContainer;

#Sinais
signal ItemFlutuantou(item: Item);
signal ItemEquipado(item: Item, antigo: Item);


#Propriedades
@export var TEXTURA: CompressedTexture2D;
@export var QUANTIDADE_MAXIMA : int;
@export var ITEM: Item;


#Recursos
func _init(Textura: CompressedTexture2D, Max: int, Tamanho: Vector2) -> void:
	TEXTURA = Textura;
	QUANTIDADE_MAXIMA = Max;
	size = Vector2(Tamanho.x * 40, Tamanho.y * 40);
	columns = Tamanho.x;

	var Id: int = 0;
	for x in Tamanho.x:
		for y in Tamanho.y:
			var slot: Slot = Slot.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"), Id, QUANTIDADE_MAXIMA);
			Id += 1;
			add_child(slot);
			slot.connect("clicou", clicou);
			if ((Id % 2) == 0):
				slot.adicionar_item(preload("res://functions/inventario/Materials/TerraCoada.tres"));


func atualizar_maximo(Quantidade: int) -> void:
	QUANTIDADE_MAXIMA = Quantidade;
	for x in get_child_count():
		get_child(x).QUANTIDADE_MAXIMA = QUANTIDADE_MAXIMA;


func temEspaco(Itm: Item) -> Array:
	for x in get_child_count():
		if (get_child(x).adicionavel(Itm)):
			return [true, x];
	return [false];

#Funções
func clicou(Itm: Item, Id: int) -> void:
	var this: Slot = get_child(Id);
	if (ITEM != null and this.adicionavel(ITEM)):
		this.adicionar_item(ITEM);
		ITEM = null;
		ItemFlutuantou.emit(ITEM);
	elif (ITEM == null and this.eVazio() == false):
		ITEM = this.remover_item();
		ItemFlutuantou.emit(ITEM);
