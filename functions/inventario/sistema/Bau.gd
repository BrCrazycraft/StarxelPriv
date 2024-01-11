class_name InventarioBau;
extends GridContainer;

#Sinais
signal ItemFlutuantou(item: Item);



#Propriedades
@export var ITEM: Item;
@export var TICKET: String;


#Recursos
func _init(Textura: CompressedTexture2D, Maximo: int, Tamanho: Vector2, Ticket: String) -> void:
	columns = Tamanho.x;
	size = Vector2(Tamanho.x * 40, Tamanho.y * 40);
	TICKET = Ticket;
	var Id: int = 0;
	for x in range(Tamanho.x):
		for y in range(Tamanho.y):
			var slot: Slot = Slot.new(Textura, Id, Maximo);
			slot.connect("clicou", clicou);
			add_child(slot);
			Id += 1;
	
	carregar();


func eVazio() -> bool:
	for x in range(get_child_count()):
		if (get_child(x).eVazio() == false):
			return false;
	return true;



func salvar() -> void:
	var inv: Dictionary = {};
	for x in get_child_count():
		var this: Slot = get_child(x);
		if (this.eVazio() == false):
			inv[x] = get_child(x).pegar_item().encode();
	
	SaveBau.Bau_Var[TICKET] = inv;
	SaveBau.salvar_bau();



func carregar() -> void:
	var Dicionario: Dictionary = SaveBau.carregar_bau(TICKET);
	var Chaves: Array = Dicionario.keys();
	
	for x in Chaves.size():
		var Itm: Item = Item.pegar_ID(Dicionario[Chaves[x]]["ID"]);
		Itm.decode(Dicionario[Chaves[x]]);
		get_child(Chaves[x]).adicionar_item(Itm);


func adicionar_força(Id: int, Itm: Item) -> void:
	var this: Slot = get_child(Id);
	this.adicionar_item(Itm);


#Funções
func clicou(Itm: Item, Id: int):
	var this: Slot = get_child(Id);
	if (ITEM != null and this.adicionavel(ITEM)):
		this.adicionar_item(ITEM);
		ITEM = null;
		ItemFlutuantou.emit(ITEM);
	elif (ITEM == null and this.eVazio() == false):
		ITEM = this.remover_item();
		ItemFlutuantou.emit(ITEM);


func _process(delta) -> void:
	if (Input.is_action_just_pressed("key_inventario")):
		salvar();
		queue_free();
