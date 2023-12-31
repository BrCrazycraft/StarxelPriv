class_name Slot;
extends Button;

#Sinais
signal clicou(item: ItemBase, id: int);


#Propriedades
var TEXTURA: CompressedTexture2D;
var NOME: String;
var QUANTIDADE: int;
var QUANTIDADE_MAXIAMA: int;
var ID: int;
var ITEM: ItemBase;


#Recursos
func _init(Textura: CompressedTexture2D, Id: int, Max: int) -> void:
	icon = Textura;
	size = Textura.get_size();
	scale = Vector2(2, 2);
	ID = Id;
	QUANTIDADE_MAXIAMA = Max;


func adicionar_vazio(Res: ItemBase) -> void:
	NOME = Res.NOME;
	QUANTIDADE = Res.QUANTIDADE;
	TEXTURA = Res.TEXTURA;
	if (!Res is ItemBase):
		ITEM = Res;
	else:
		ITEM == null;
	atualizar();


func limpar() -> void:
	TEXTURA  = null;
	NOME = "";
	QUANTIDADE = -1;
	ITEM = null;


func remover() -> ItemBase:
	if (ITEM == null):
		var exit: ItemBase = ItemBase.new();
		exit.novo(TEXTURA, NOME, QUANTIDADE);
		limpar();
		return exit;
	elif (ITEM is ItemBloco):
		var exit: ItemBloco = ItemBloco.new();
		exit.construtor(TEXTURA, ITEM.TEXTURA_CHAO, NOME, ITEM.RESISTENCIA, QUANTIDADE)
		limpar();
		return exit;
	elif (ITEM is ItemFerramenta):
		var exit: ItemFerramenta = ItemFerramenta.new();
		exit.construtor(TEXTURA, NOME, ITEM.DANO, ITEM.DURABILIDADE, ITEM.TIPO, ITEM.EFEITO , QUANTIDADE);
		limpar();
		return exit;
	return null;


func adicionar_quantidade(valor: int) -> bool:
	if ((valor + QUANTIDADE) <= QUANTIDADE_MAXIAMA):
		QUANTIDADE += valor;
		return true;
	return false;


func e_adicionavel(Res: ItemBase) -> bool:
	if (NOME == "" and ITEM == null):
		return true;
	
	if (Res is ItemFerramenta):
		return false;
	
	if (((Res.QUANTIDADE + QUANTIDADE) <= QUANTIDADE_MAXIAMA) and (NOME == Res.NOME)):
		return true;
	return false;


func atualizar() -> void:
	if (NOME != ""):
		get_child(0).texture = TEXTURA;
	else:
		get_child(0).texture = null;


#Funções
func _ready() -> void:
	connect("pressed", click);
	var Sprite = Sprite2D.new();
	Sprite.position = Vector2(size.x / 2, size.y / 2);
	add_child(Sprite);


func click() -> void:
	if (NOME != "" and ITEM != null):
		clicou.emit(remover(), ID);
