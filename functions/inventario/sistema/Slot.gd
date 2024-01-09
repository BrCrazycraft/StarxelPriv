class_name Slot;
extends Button;

#Sinais
signal clicou(Itm: Item, Id: int);

#Propriedades
@export var QUANTIDADE: int;
@export var QUANTIDADE_MAXIMA: int;
@export var DURABILIDADE: int;
@export var ID: int;
@export var ITEM: Item;


#Recursos
func _init(Textura: CompressedTexture2D, Id: int, Max: int) -> void:
	icon = Textura;
	size = Textura.get_size();
	QUANTIDADE_MAXIMA = Max;
	ID = Id;
	QUANTIDADE = -1;
	DURABILIDADE = -1;
	ITEM = null;
	
	var Sprite: TextureRect = TextureRect.new();
	var Text: Label = Label.new();
	Sprite.set_anchors_preset(Control.PRESET_FULL_RECT);
	add_child(Sprite);
	add_child(Text);


func eItem(value: Item) -> bool:
	if (value is ItemMaterial or value is ItemBloco):
		return true;
	return false;


func eVazio() -> bool:
	if (ITEM == null and (QUANTIDADE == -1 and DURABILIDADE == -1)):
		return true;
	return false;


#<Recursos do Item>
func adicionar_item(Itm: Item) -> bool:
	if (ITEM == null and (QUANTIDADE == -1 and DURABILIDADE == -1)):
		if (eItem(Itm)):
			QUANTIDADE = Itm.QUANTIDADE;
			ITEM = Itm;
			
			atualizar();
			return true;
	elif (Itm.NOME == ITEM.NOME and (ITEM != null and (QUANTIDADE != -1 or DURABILIDADE != -1))):
		if (eItem(Itm)):
			if ((QUANTIDADE + Itm.QUANTIDADE) <= QUANTIDADE_MAXIMA):
				QUANTIDADE += Itm.QUANTIDADE;
				
				atualizar();
				return true;
	return false;


func adicionavel(Itm: Item) -> bool:
	if ((ITEM == null and (QUANTIDADE == -1 and DURABILIDADE == -1)) or (Itm.NOME == ITEM.NOME and (ITEM != null and (QUANTIDADE != -1 or DURABILIDADE != -1)))):
		if (eItem(Itm) == false):
			return true;
		else:
			if ((QUANTIDADE + Itm.QUANTIDADE) <= QUANTIDADE_MAXIMA):
				return true;
	return false;

func remover_item() -> Item:
	if (ITEM != null and (QUANTIDADE != -1 or DURABILIDADE != -1)):
		if (eItem(ITEM)):
			var exit: ItemMaterial = ItemMaterial.new();
			exit.novo(ITEM.TEXTURA, ITEM.NOME, ITEM.TIPO, QUANTIDADE);
			
			ITEM = null;
			QUANTIDADE = -1;
			DURABILIDADE = -1;
			
			atualizar();
			return exit;
	return null;


func pegar_item() -> Item:
	if (ITEM != null and (QUANTIDADE != -1 or DURABILIDADE != -1)):
		if (eItem(ITEM)):
			var exit: ItemMaterial = ItemMaterial.new();
			exit.novo(ITEM.TEXTURA, ITEM.NOME, ITEM.TIPO, QUANTIDADE);
			return exit;
	return null;


func atualizar() -> void:
	if (get_child(1) != null):
		get_child(1).queue_free();

	if (ITEM == null):
		get_child(0).texture = null;
	else:
		get_child(0).texture = ITEM.TEXTURA;
		if (eItem(ITEM)):
			var Text: Label = Label.new();
			Text.text = str(QUANTIDADE);
			Text.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT;
			Text.size.x = size.x;
			Text.position.y = ITEM.TEXTURA.get_size().y - 8;
			add_child(Text);


#Funções



func _pressed() -> void:
	if (ITEM != null and (QUANTIDADE != -1 or DURABILIDADE != -1)):
		clicou.emit(ITEM, ID);
	elif (ITEM == null and (QUANTIDADE == -1 and DURABILIDADE == -1)):
		clicou.emit(null, ID);
	else:
		print_debug("Error[", str(ID),"]: Slot Clicado ou Selecionado");
